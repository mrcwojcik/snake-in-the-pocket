package pl.mrcwojcik.pdfgenerator;

import java.awt.Color;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import pl.mrcwojcik.entity.Bill;

@Component
public class PDFBuilder extends AbstractPdfView {

    @Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
                                    PdfWriter writer, HttpServletRequest req, HttpServletResponse resp)
            throws Exception {

        List<Bill> billList = (List<Bill>) model.get("billsToPdf");
        doc.add(new Paragraph("Transakcje na koncie"));

        PdfPTable table = new PdfPTable(5);
        table.setSpacingBefore(10);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f, 1.0f});

        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(Color.WHITE);

        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(Color.BLUE);
        cell.setPadding(5);

        cell.setPhrase(new Phrase("Data", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Konto", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Płatnik", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("Wartość", font));
        table.addCell(cell);

        cell.setPhrase(new Phrase("PlusOrMinus", font));
        table.addCell(cell);

        for (Bill bill : billList){
            table.addCell(String.valueOf(bill.getCreated()));
            table.addCell(bill.getAccount().getAccountName());
            table.addCell(bill.getPayer().getName());
            table.addCell(String.valueOf(bill.getBillValue()));
            if (bill.isPlusOrMinus()){
                table.addCell("Wpłata");
            } else {
                table.addCell("Wydatek");
            }
        }


            doc.add(table);

    }

}