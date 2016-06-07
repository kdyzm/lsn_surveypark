package com.kdyzm.struts.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.kdyzm.domain.Page;
import com.kdyzm.domain.Question;
import com.kdyzm.domain.Survey;
import com.kdyzm.domain.User;
import com.kdyzm.domain.statistic.QuestionStatisticModel;
import com.kdyzm.service.StatisticService;
import com.kdyzm.service.SurveyService;
import com.kdyzm.struts.action.aware.UserAware;
import com.kdyzm.struts.action.base.BaseAction;
import com.kdyzm.utils.FileUploadUtils;
import com.opensymphony.xwork2.ActionContext;

@Controller("surveyAction")
@Scope("prototype")
public class SurveyAction extends BaseAction<Survey> implements UserAware, ServletContextAware {
	private Logger logger=Logger.getLogger(SurveyAction.class);
	private static final long serialVersionUID = -2866898387974853835L;
	private User user;
	@Resource(name = "surveyService")
	private SurveyService surveyService;

	/**
	 * 创建新的Survey的方法
	 * 
	 * @return
	 * @throws Exception
	 */
	public String createNewSurvey() throws Exception {
		// 创建完成之后直接转到显示Survey的页面上
		this.surveyService.createNewSurvey(user);
		return "toMySurveyPageAction";
	}

	@Override
	public void setUser(User user) {
		this.user = user;
	}

	// 跳转到我的调查页面
	public String toMySurveyPage() throws Exception {
		List<Survey> surveys = this.surveyService.findMySurveys(user);
		ActionContext.getContext().put("surveys", surveys);
//		ActionContext.getContext().getSession().get("");
		return "toMySurveyPage";
	}

	// 跳转到设计Survey界面上
	public String designSurveyPage() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String surveyId = request.getParameter("surveyId");
		this.model = this.surveyService.getModelById(Integer.parseInt(surveyId));
		logger.info(model.getPages().size());
		ActionContext.getContext().getValueStack().push(model);
		return "designSurveyPage";
	}

	// 跳转到编辑调查的页面上去
	public String toEditSurveyPage() throws Exception {
		this.model = this.surveyService.getModelById(this.model.getSurveyId());
		return "toEditSurveyPage";
	}

	public String editSurvey() throws Exception {
		// 这里由于Survey和User之间是单向关联关系，所以必须手动维护关系，但是和Pages之间的关系就不需要维护了
		this.model.setUser(user);
		this.surveyService.updateSurvey(this.model);
		return "toDesignSurveyPageAction";
	}

	// 删除调查的方法
	public String deleteSurvey() throws Exception {
		this.surveyService.deleteSurvey(this.model);
		return "toMySurveyPageAction";
	}

	/**
	 * 清除调查的方法 清除调查：就是在正式将该调查发布之前，首先将自己之前的测试数据全部删除掉
	 * 
	 * @return
	 * @throws Exception
	 */
	public String clearSurvey() throws Exception {
		this.surveyService.clearSurvey(this.model);
		return "toMySurveyPageAction";
	}

	/**
	 * 打开或者关闭调查的方法
	 * 
	 * @return
	 * @throws Exception
	 */
	public String openOrCloseSurvey() throws Exception {
		logger.info("访问了SurveyAction的openOrCloseSurvey方法！");
		this.surveyService.updateSurveyClosedState(this.model);
		logger.info("访问完成SurveyAction的openOrCloseSurvey方法！");
		return "toMySurveyPageAction";
	}

	// 跳转到上传logo的页面
	public String toUploadLogoPage() throws Exception {
		return "toUploadLogoPage";
	}

	// 上传的logo图片
	private File logo; // 上传的logo的文件
	private String logoFileName; // 上传的文件的名称
	private String logoContentType; // 上传的文件的类型

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public String getLogoContentType() {
		return logoContentType;
	}

	public void setLogoContentType(String logoContentType) {
		this.logoContentType = logoContentType;
	}

	public File getLogo() {
		return logo;
	}

	public void setLogo(File logo) {
		this.logo = logo;
	}

	// 实施上传logo动作的方法
	public String doUploadLogo() throws Exception {
		// 首先需要保存住上传的文件！
		String fileName = FileUploadUtils.saveUploadFileToDestDir(logo, logoFileName);
		// 接着需要将保存住的文件和Survey对象关联起来
		model = this.surveyService.getModelById(model.getSurveyId());
		model.setLogoPath(fileName);
		logger.info(fileName);
		this.surveyService.updateSurvey(model);
		return "toDesignSurveyPageAction";
	}

	private ServletContext sc;

	@Override
	public void setServletContext(ServletContext context) {
		this.sc = context;
	}

	// 一个方法专门判断上传的文件是否存在！
	public boolean isLogoImageExists() throws Exception {
		String fileName = this.model.getLogoPath();
		File file = new File(sc.getRealPath(fileName));
		return file.exists();
	}

	/**
	 * 为了实现文件下载功能，必须提供一个输入流 名字根据StreamResult类中的要求，可以自定义，如果
	 * 没有进行配置，则必须使用默认的名称：inputStream。 并且提供get/set方法
	 */
	private InputStream inputStream;

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Resource(name = "statisticService")
	private StatisticService statisticService;

	// 收集信息，生成报表，这里是使用Excel表格的形式进行数据的统计
	public String collectionInforForOneSurvey() throws Exception {
		// File file=new File("G://d6c5519caeb6cc8666cc9f3854b5d74a.png");
		// inputStream=new FileInputStream(file);
		Survey survey = this.surveyService.getModelById(this.model.getSurveyId());
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFCellStyle style = workbook.createCellStyle();
		style.setFillForegroundColor(HSSFColor.WHITE.index);
		// style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		// 生成一个字体
		HSSFFont font = workbook.createFont();
		// font.setColor(HSSFColor.VIOLET.index);
		font.setFontHeightInPoints((short) 15);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		style.setFont(font);

		// 生成并设置另一个样式
		HSSFCellStyle style2 = workbook.createCellStyle();
		style2.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
		style2.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		style2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style2.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style2.setBorderTop(HSSFCellStyle.BORDER_THIN);
		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		// 生成另一个字体
		HSSFFont font2 = workbook.createFont();
		font2.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		// 把字体应用到当前的样式
		style2.setFont(font2);

		Set<Page> pages = survey.getPages();

		Sheet sheet = workbook.createSheet(survey.getTitle());
		sheet.setDefaultColumnWidth((short) 20);

		CellRangeAddress headerRegion1 = new CellRangeAddress(0, 0, (short) 0, (short) 5);
		sheet.addMergedRegion(headerRegion1);
		Row header = sheet.createRow(0);
		header.setHeight((short) 1024);
		Cell headerCell = header.createCell(0);
		long surveyJoinAmount = this.statisticService.getAllJoinSurveyPersonsAmount(survey.getSurveyId());
		headerCell.setCellValue("一共有 "+surveyJoinAmount+" 参加了 "+survey.getTitle()+" 调查");
		headerCell.setCellStyle(style);
		int rowIndex = 1;
		for (Page page : pages) {
			CellRangeAddress region1 = new CellRangeAddress(rowIndex, rowIndex, (short) 0, (short) 5);
			Set<Question> questions = page.getQuestions();
			Row row = sheet.createRow(rowIndex);
			sheet.addMergedRegion(region1);
			Cell cell0 = row.createCell(0);
			cell0.setCellValue("第" + rowIndex + "页：" + page.getTitle());
			cell0.setCellStyle(style);
			rowIndex++;
			for (int i = 1; i <= 5; i++) {
				Cell cell = row.createCell(i);
				cell.setCellValue("");
				cell.setCellStyle(style);
			}
			int j=0;
			for (Question question : questions) {
				QuestionStatisticModel model = this.statisticService.statics(question);
				Row row_content=sheet.createRow(rowIndex);
				rowIndex++;
			}
		}
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		workbook.write(os);
		inputStream = new ByteArrayInputStream(os.toByteArray());
		ActionContext.getContext().put("fileName", URLEncoder.encode(survey.getTitle() + ".xls", "utf-8"));
		return "downloadExcel";
	}
}
