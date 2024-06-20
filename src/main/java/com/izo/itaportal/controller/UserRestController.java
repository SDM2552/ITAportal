package com.izo.itaportal.controller;


import com.itextpdf.text.pdf.BaseFont;
import com.izo.itaportal.service.CategoryService;
import com.izo.itaportal.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import com.itextpdf.text.*;



@RestController
@RequestMapping("/api")
public class UserRestController {
    @Autowired
    private StudentService studentService;

    @Autowired
    private CategoryService categoryService;
    @GetMapping("/checkSession")
    public Map<String, Boolean> checkSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        Map<String, Boolean> response = new HashMap<>();
        if (session == null || session.getAttribute("loginUser") == null) {
            response.put("isLoggedIn", false);
        } else {
            response.put("isLoggedIn", true);
        }
        return response;
    }
    @GetMapping("/certificate")
    public ResponseEntity<InputStreamResource> generateCertificate(
            @RequestParam("pgmName") String pgmName,
            @RequestParam("stuName") String stuName,
            @RequestParam("endDt") String endDt) throws DocumentException, IOException {

        ByteArrayOutputStream out = new ByteArrayOutputStream();

        Document document = new Document();
        PdfWriter.getInstance(document, out);
        document.open();

        BaseFont baseFont = BaseFont.createFont("src/main/resources/static/font/NotoSansKR-VariableFont_wght.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font titleFont = new Font(baseFont, 20, Font.BOLD);
        Font contentFont = new Font(baseFont, 12);
        Font nameFont = new Font(baseFont, 16, Font.BOLD);

        Paragraph title = new Paragraph("교육 수료증", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);

        Paragraph content = new Paragraph();
        content.setAlignment(Element.ALIGN_CENTER);
        content.add(new Paragraph("성명: " + stuName, nameFont));
        content.add(Chunk.NEWLINE);
        content.add(new Paragraph("과정명: " + pgmName, nameFont));
        content.add(Chunk.NEWLINE);
        content.add(new Paragraph("위 사람은 본 기관이 실시한 교육 과정을 성실히 이수 하였기에 이 증서를 수여합니다.", nameFont));
        content.add(Chunk.NEWLINE);
        content.add(new Paragraph("국제무역아카데미", nameFont));

        document.add(title);
        document.add(Chunk.NEWLINE);
        document.add(content);

        document.close();

        ByteArrayInputStream bis = new ByteArrayInputStream(out.toByteArray());
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=certificate.pdf");

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_PDF)
                .body(new InputStreamResource(bis));
    }
    @PostMapping("/certificate")
    public ResponseEntity<Map<String, String>> generateCertificate(@RequestBody Map<String, String> request) throws DocumentException, IOException {
        String pgmName = request.get("pgmName");
        String stuName = request.get("stuName");

        System.out.println("pgmName: " + pgmName); // 디버깅을 위한 로그
        System.out.println("stuName: " + stuName); // 디버깅을 위한 로그

        ByteArrayOutputStream out = new ByteArrayOutputStream();

        Document document = new Document();
        PdfWriter.getInstance(document, out);
        document.open();

        BaseFont baseFont = BaseFont.createFont("src/main/resources/static/font/NotoSansKR-VariableFont_wght.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font titleFont = new Font(baseFont, 20, Font.BOLD);
        Font contentFont = new Font(baseFont, 12);

        Paragraph title = new Paragraph("교육 수료증", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);

        Paragraph content = new Paragraph();
        content.setAlignment(Element.ALIGN_CENTER);
        content.add(new Paragraph("성명: ", contentFont));
        content.add(new Paragraph(stuName, titleFont));
        content.add(new Paragraph("위 사람은 본 기관이 실시한 교육 과정을 성실히 이수 하였기에 이 증서를 수여합니다.", contentFont));
        content.add(new Paragraph(pgmName, titleFont));

        document.add(title);
        document.add(Chunk.NEWLINE);
        document.add(content);

        document.close();

        // 임시 디렉토리에 파일 저장
        String tempDir = System.getProperty("java.io.tmpdir");
        String pdfFileName = tempDir + File.separator + "certificate.pdf";
        FileOutputStream fos = new FileOutputStream(pdfFileName);
        fos.write(out.toByteArray());
        fos.close();

        String encodedFileName = Base64.getUrlEncoder().encodeToString(pdfFileName.getBytes());

        Map<String, String> response = new HashMap<>();
        response.put("url", "/api/view?fileName=" + encodedFileName);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/view")
    public ResponseEntity<InputStreamResource> viewCertificate(@RequestParam("fileName") String encodedFileName) throws IOException {
        String pdfFileName = new String(Base64.getUrlDecoder().decode(encodedFileName));
        File file = new File(pdfFileName);
        if (!file.exists()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

        InputStreamResource resource = new InputStreamResource(new FileInputStream(file));

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=" + file.getName());

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentLength(file.length())
                .contentType(MediaType.APPLICATION_PDF)
                .body(resource);
    }
}
