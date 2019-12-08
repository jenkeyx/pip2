import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "ControllerServlet", urlPatterns = "controllerServlet")
public class ControllerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (hasParams(request)){
            if (hasRequiredParams(request)){
                if (hasCorrectParams(request)){
                    request.getRequestDispatcher("WEB-INF/areaCheckServlet").forward(request,response);
                }
                else {
                    //todo ErrorBean
                    request.getRequestDispatcher("WEB-INF/error.jsp");
                }
            }
        }else {
            response.sendRedirect("index.jsp");
        }
    }

    private boolean hasParams(HttpServletRequest request){
       return request.getParameterMap().isEmpty();
    }
    private boolean hasRequiredParams(HttpServletRequest request){
        Map<String,String[]> paramsMap= request.getParameterMap();
        return paramsMap.containsKey("checkbox[]") && paramsMap.containsKey("y") && paramsMap.containsKey("r");
    }
    private boolean hasCorrectParams(HttpServletRequest request){
        return isCheckboxCorrect(request)&&isTextAreaCorrect(request);
    }

    private boolean isCheckboxCorrect(HttpServletRequest request){
        boolean result = false;
        String[] xArr= request.getParameterValues("checkbox[]");
        for ( String xStr : xArr) {
            if (isNaN(xStr)){
                double x = Double.parseDouble(xStr);
                if (x > -2 && x < 2 ){
                    result = true;
                }
            }
        }
        return result;
    }
    private boolean isTextAreaCorrect(HttpServletRequest request){
        boolean result = false;
        String yStr = request.getParameter("y");
        if (isNaN(yStr)){
           double y =  Double.parseDouble(yStr);
           if (y>=-3 && y<=5){
               result = true;
           }
        }
        return result;
    }
    private boolean isNaN(String x){
        return Double.isNaN(Double.parseDouble(x));
    }

};
