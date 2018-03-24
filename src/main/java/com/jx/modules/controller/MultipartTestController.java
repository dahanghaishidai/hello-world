package com.jx.modules.controller;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping(value = "/multipartTestController")
public class MultipartTestController{

    public MultipartTestController() {
        super();
    }

    @RequestMapping(value = "/pickUp",method = RequestMethod.POST)
    public void pickUp(HttpServletRequest request)
            throws ServletException, IOException {

        //文件保存路径
        String fiD = "E:/ideaWorkspace/big/src/main/webapp/images/";

        request.setCharacterEncoding("utf-8");
        RequestContext requestContext = new ServletRequestContext(request);

        if(FileUpload.isMultipartContent(requestContext)){

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setRepository(new File(fiD));
            ServletFileUpload upload = new ServletFileUpload(factory);
            //upload.setHeaderEncoding("utf-8");
            upload.setSizeMax(2000000);
            List items = new ArrayList();
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e1) {
                System.out.println("文件上传发生错误" + e1.getMessage());
            }

            Iterator it = items.iterator();
            while(it.hasNext()){
                FileItem fileItem = (FileItem) it.next();
                if(fileItem.isFormField()){
                    System.out.println(fileItem.getFieldName() + "   " + fileItem.getName() + "   " + new String
                            (fileItem.getString().getBytes("iso8859-1"), "gbk"));
                }else{
                    System.out.println(fileItem.getFieldName() + "   " +
                            fileItem.getName() + "   " + fileItem.isInMemory() + "    " +
                            fileItem.getContentType() + "   " + fileItem.getSize());

                    if(fileItem.getName()!=null && fileItem.getSize()!=0){
                        File fullFile = new File(fileItem.getName());
                        File newFile = new File(fiD + fullFile.getName());
                        try {
                            fileItem.write(newFile);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }else{
                        System.out.println("文件没有选择 或 文件内容为空");
                    }
                }

            }
        }
    }

}
