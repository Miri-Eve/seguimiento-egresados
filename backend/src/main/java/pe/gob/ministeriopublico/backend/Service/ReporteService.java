package pe.gob.ministeriopublico.backend.Service;

import net.sf.jasperreports.engine.*;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Service
public class ReporteService {

    public JasperPrint generarReporte() throws JRException {

        InputStream reporteStream =
                getClass().getResourceAsStream("/reports/reporte_egresados.jrxml");

        JasperReport jasperReport =
                JasperCompileManager.compileReport(reporteStream);

        Map<String, Object> parametros = new HashMap<>();

        JasperPrint jasperPrint =
                JasperFillManager.fillReport(
                        jasperReport,
                        parametros,
                        new JREmptyDataSource()
                );

        return jasperPrint;
    }
}
