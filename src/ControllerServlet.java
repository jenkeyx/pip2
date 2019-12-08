
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.dom.DOMCryptoContext;
import java.util.Map;

@WebServlet(name = "ControllerServlet", urlPatterns = "controllerServlet")
public class ControllerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
    }

    private boolean hasParams(HttpServletRequest request){
       return request.getParameterMap().isEmpty();
    }
    private boolean hasRequiredParams(HttpServletRequest request){
        Map<String,String[]> paramsMap= request.getParameterMap();
        return paramsMap.containsKey("checkbox[]") && paramsMap.containsKey("y") && paramsMap.containsKey("r");
    }
    private boolean hasCorrectParams(HttpServletRequest request){
        return isCkeckboxCorrect(request)&&isTextAreaCorrect(request);
    }

    private boolean isCkeckboxCorrect(HttpServletRequest request){
        boolean result = false;
        String[] xArr= request.getParameterValues("checkbox[]");
        for ( String xStr : xArr) {
            if (isNaN(xStr)){
                Double x = Double.parseDouble(xStr);
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
           Double y =  Double.parseDouble(yStr);
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
