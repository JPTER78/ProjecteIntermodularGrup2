package controladors;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class VistaLoginController {
	
	@FXML private VBox root;
	@FXML private Button botoEixir;
	@FXML private Button botoBorrarDades;
	@FXML private Button botoLogear;
	@FXML private TextField correu;
	@FXML private PasswordField contrasenya;
	@FXML private Label error;
	
	public void eixirLogin (ActionEvent e) {
		try {
			Parent root2 = FXMLLoader.load(getClass().getResource("/vistes/VistaIniciPrograma.fxml"));
			Scene escena2 = new Scene(root2);
			Stage window = (Stage) ((Node) e.getSource()).getScene().getWindow();
			window.setScene(escena2);
			window.setTitle("Menu");
			window.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	public void esborrarDades (ActionEvent e) {
        correu.setText(null);
        contrasenya.clear();
        error.setText("");
	}
	
	public void logearUsuari (ActionEvent e) {
		String emailUsuari = correu.getText().trim();
        String contrasenyaUsuari = contrasenya.getText().trim();
        
        if (emailUsuari.isEmpty() || contrasenyaUsuari.isEmpty()) {
        	error.setStyle("-fx-text-fill: red;");
			error.setText("No pots deixar camps en blanc");
        } else {
        	try {
            	Class.forName("org.mariadb.jdbc.Driver");
    			
    			String urlBaseDades = "jdbc:mysql://localhost:3306/Equip2PI";
    			String usuari = "root";
    			String contrasenya = "";
    			
    			Connection c = DriverManager.getConnection(urlBaseDades, usuari, contrasenya);
    			Statement s = c.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
    			ResultSet r = s.executeQuery("SELECT * FROM Usuari");
    			boolean usuariRegistrat = false;
    			
    			while (r.next()) {
    				if (r.getString("Email").equals(emailUsuari)) {
    					if (r.getString("Contrasenya").equals(contrasenyaUsuari)) {
    						usuariRegistrat = true;
    					}
    				}
    			}
    			
    			if (usuariRegistrat) {
    		        error.setStyle("-fx-text-fill: green;");
    		        error.setText("Logeat correctament");
    		        
    		        Parent root2 = FXMLLoader.load(getClass().getResource("/vistes/VistaAplicacioBase.fxml"));
        			Scene escena2 = new Scene(root2);
        			Stage window = (Stage) ((Node) e.getSource()).getScene().getWindow();
        			window.setScene(escena2);
        			window.setTitle("Movie Rater");
        			window.show();
    			} else {
    				error.setStyle("-fx-text-fill: red;");
    				error.setText("Correu i/o contrasenya incorrectes");
    			}
    		} catch (Exception e2) {
//    			System.out.println("Error: " + e2);
    		}
        }
        
	}
	
}