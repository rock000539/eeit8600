package tw.com.softleader.eeit8600.app.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tw.com.softleader.eeit8600.app.entity.AppEntity;
import tw.com.softleader.eeit8600.app.service.AppService;

@WebServlet("/app/AppAdd.do")
public class AppServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Collection<String> errorMessage = new ArrayList<>();
		request.setAttribute("ErrorMsg", errorMessage);

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("aId");
		if (id == null || id.trim().length() == 0)
			errorMessage.add("編號欄必須輸入");

		String name = request.getParameter("aName");
		if (name == null || name.trim().length() == 0)
			errorMessage.add("名稱欄必須輸入");

		String evalu = request.getParameter("aEvalu");
		if (evalu == null || evalu.trim().length() == 0)
			errorMessage.add("評價欄必須輸入");

		String download = request.getParameter("aDownload");
		if (download == null || download.trim().length() == 0)
			errorMessage.add("地址欄必須輸入");

		String url = request.getParameter("aUrl");
		if (url == null || url.trim().length() == 0)
			errorMessage.add("地址欄必須輸入");

		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/app/resp/Error.jsp");
			rd.forward(request, response);
			return;
		}
		
		AppEntity app = new AppEntity(Integer.parseInt(id), name, Integer.parseInt(evalu), Integer.parseInt(download), url);
		try {
			AppService service = new AppService();
			service.insert(app);
			request.setAttribute("appEntity", app);
			RequestDispatcher rd = request.getRequestDispatcher("/app/resp/Success.jsp");
			rd.forward(request, response);
			return;
		} catch (SQLException e) {
			if (e.getMessage().indexOf("重複的索引鍵") != -1 || e.getMessage().indexOf("Dulplicate") != -1) {
				errorMessage.add("資料庫存取錯誤:" + e.getMessage());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/app/resp/Error.jsp");
				rd.forward(request, response);
				return;
			}
		}
	}

}
