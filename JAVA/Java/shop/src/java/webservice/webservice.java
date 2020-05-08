
package webservice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class webservice {
    
    public String getData(String link){
        String input = null;
        try{
            URL url = new URL(link);
            URLConnection con = url.openConnection();
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), Charset.forName("UTF-8")));
            
            input = br.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return input;
    }
    
    
    public JSONArray getJSONArrayData(String link){
        JSONArray ja = null;
        try{
            
            URL url = new URL(link);
            URLConnection con = url.openConnection();
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), Charset.forName("UTF-8")));
            
            
            String input = br.readLine();
            
            
            input = input.substring(1, input.length()-1).replace("\\", "");
            System.out.println(input);
            
            ja = new JSONArray(input);
        } catch (IOException e) {
            e.printStackTrace();
        }  catch (JSONException ex) {
                Logger.getLogger(webservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ja;
    }
    
    
    public JSONObject getJSONObjectData(String link){
        JSONObject ja = null;
        try{
            URL url = new URL(link);
            URLConnection con = url.openConnection();
            BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), Charset.forName("UTF-8")));
            
            String input = br.readLine();
            input = input.substring(1, input.length()-1).replace("\\", "");
            
            ja = new JSONObject(input);
        } catch (IOException e) {
            e.printStackTrace();
        }  catch (JSONException ex) {
                Logger.getLogger(webservice.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ja;
    }
    
    
    public boolean sendToServer(JSONObject jo, String url) throws IOException{
        URL object=new URL(url);
        
        HttpURLConnection con = (HttpURLConnection) object.openConnection();
        con.setDoInput(true);
        con.setDoOutput(true);
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setRequestMethod("POST");
        
        OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
        osw.write(jo.toString());
        osw.flush();
        
        StringBuilder sb = new StringBuilder();  
        int HttpResult = con.getResponseCode(); 
        if (HttpResult == HttpURLConnection.HTTP_OK) {
            return true;
        } else {
            return false;
        }  
    }
    
    public static void main(String[] args) throws IOException, JSONException {
        String link = "http://172.20.10.3/api/shop/getListProductByNew";
        
        webservice ws = new webservice();

        JSONArray ja = ws.getJSONArrayData(link);


        JSONObject jo;
        for(int i = 0;i<ja.length();i++){
            jo = ja.getJSONObject(i);
            System.out.println(jo);
        }
//        System.out.println(ws.getData(link));
    }
}
