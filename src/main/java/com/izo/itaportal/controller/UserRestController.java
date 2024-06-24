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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
    @PostMapping("/certificate")
    public ResponseEntity<Map<String, String>> generateCertificate(@RequestBody Map<String, String> request) throws DocumentException, IOException {
        String pgmName = request.get("pgmName");
        String stuName = request.get("stuName");

        ByteArrayOutputStream out = new ByteArrayOutputStream();

        Document document = new Document();
        PdfWriter writer = PdfWriter.getInstance(document, out);
        document.open();

        ClassLoader classLoader = getClass().getClassLoader();
        InputStream fontStream = classLoader.getResourceAsStream("static/font/NotoSansKR-VariableFont_wght.ttf");
        if (fontStream == null) {
            throw new FileNotFoundException("Font file not found in WAR");
        }

        BaseFont baseFont = BaseFont.createFont("src/main/resources/static/font/NotoSansKR-VariableFont_wght.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        Font titleFont = new Font(baseFont, 35, Font.BOLD);
        Font contentFont = new Font(baseFont, 23);

        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
        String formattedDate = today.format(formatter);

        Paragraph title = new Paragraph("교육 수료증", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);

        Paragraph nameAndProgram = new Paragraph();
        nameAndProgram.setAlignment(Element.ALIGN_LEFT);
        nameAndProgram.setIndentationLeft(80);
        nameAndProgram.setSpacingAfter(10);
        nameAndProgram.add(new Chunk("성명 : " + stuName, contentFont));
        nameAndProgram.add(Chunk.NEWLINE);
        nameAndProgram.add(new Paragraph(" ", contentFont));
        nameAndProgram.add(new Chunk("과정명 : " + pgmName, contentFont));

        Paragraph content = new Paragraph();
        content.setAlignment(Element.ALIGN_CENTER);
        content.add(new Paragraph("위 사람은 본 기관이 실시한 교육 과정을 성실히 이수 하였기에 이 증서를 수여합니다.", contentFont));
        content.add(Chunk.NEWLINE);

        Paragraph dateParagraph = new Paragraph(formattedDate, contentFont);
        dateParagraph.setAlignment(Element.ALIGN_CENTER);

        Paragraph organization = new Paragraph("국제무역아카데미", contentFont);
        organization.setAlignment(Element.ALIGN_CENTER);

        document.add(title);
        document.add(Chunk.NEWLINE);
        document.add(nameAndProgram);
        document.add(Chunk.NEWLINE);
        document.add(content);
        document.add(Chunk.NEWLINE);
        document.add(dateParagraph);
        document.add(Chunk.NEWLINE);
        document.add(organization);

        document.close();

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
