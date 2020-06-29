<%@ page import="matrix.db.*, java.io.*,java.io.IOException,java.io.RandomAccessFile,java.util.concurrent.*" %>
<html>
<head>
<title>See Logs</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>


<body bgcolor=black>



	<font color=white>
	c:/systemOut.log <br><br>_________________________________<br>
<%
	java.io.File logFile = null;
	try{
		if (application.getAttribute("ps")==null){
			java.io.PrintStream ps = new java.io.PrintStream(new java.io.FileOutputStream("c:/systemOut.log"));
			application.setAttribute("ps",ps);
			System.setOut(ps);
			System.setErr(ps);
		}
		
		
		//System.out.println("step1");
		java.io.File logFile2 = new java.io.File("c:/systemOut.log");
		logFile = logFile2;
		//System.out.println("step2");

	}catch(Exception e){

		//System.out.println("step3");
		
%>

<form action="TGISeeLog.jsp">
	Please input tomcat log path <input name=filepath size=50> c:/systemOut.log
	<input type=submit>
</form>
	
<%
	return;
	}
		//System.out.println("step4");

	String path="";
    String filesize="";
    long fileLength=0L;
    String filesizeRemember="";
	try{
        
        filesize=request.getParameter("filesize");
        fileLength = logFile.length();
        

        path = "c:/systemOut.log";
        //out.println("-----DEBUG FOR YOU. YOU CAN SEE LOG FOR 4 MINUTES-----<BR><BR>");
        out.flush();

        
        
        
        RandomAccessFile randomAccessFile = new RandomAccessFile(logFile,"r");
        //FileInputStream fileInputStream=new FileInputStream(logFile);
        //InputStreamReader inputStreamReader=new InputStreamReader(fileInputStream); 
        //LineNumberReader lineNumberReader=new LineNumberReader(inputStreamReader);
        //System.out.println("fileLength="+fileLength);
        //out.println(filesize!=null&&!filesize.equals(""));
        if(filesize!=null&&!filesize.equals("")){
            //out.println("Long.parseLong(filesize)="+Long.parseLong(filesize));
            randomAccessFile.seek(Long.parseLong(filesize));
            
        }else{
            randomAccessFile.seek(fileLength);
            
        }
        //long fsize=fileLength;
        
        String tmp = "";     
        for (int loop = 0;loop<150;loop++){ 
            String str="";
            while( (tmp = randomAccessFile.readLine())!= null) {     
                str=new String(tmp.getBytes("ISO8859-1"),"utf-8");
                str=str.replaceAll(" ","&nbsp;").replaceAll("\t","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") ;
                str=str.replaceAll("<","&lt;").replaceAll(">","&gt;")+ "</br>";
                out.println(str);
                if(!str.equals("")){
                    %>
                    <script>
                        document.getElementsByTagName('BODY')[0].scrollTop=document.getElementsByTagName('BODY')[0].scrollHeight;
                    </script>
                    <%
                }
                
                    
            }   
            
            out.flush();		
            
            Thread.sleep(2000);
            
            
        }
        
        //final RandomAccessFile randomFile = new RandomAccessFile(logFile,"r");     

        //System.out.println("fileLength="+fileLength);
        //long lastTimeFileSize =fileLength;  
        
        //out.println("-----4 MINUTES PASSED. LOG STOPPED. PLEASE REFRESH TO SEE MORE-----<BR><BR>");    
                
	}catch(Exception e){

		e.printStackTrace();
	}

	%>
</font>
<script>
var filepath="<%="c:/systemOut.log"%>";

var search = location.search;
if(search.indexOf("filesize")!=-1){
    //search=search.replace(/<%=filesize%>/, "<%=fileLength%>");
    //alert("<%=filesize%>");
    //alert(search);
    location.search=search;
}else{
    search=location.search+"&filesize="+"<%=fileLength%>";
    location.search=search;
}

//console.log(location.search);
//location.reload();
</script>
</body>
</html>