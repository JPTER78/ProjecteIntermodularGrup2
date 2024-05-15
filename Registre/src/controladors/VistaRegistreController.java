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
import javafx.scene.control.DatePicker;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class VistaRegistreController {
	
	@FXML private VBox root;
	@FXML private Button botoEixir;
	@FXML private Button botoBorrarDades;
	@FXML private Button botoRegistrar;
	@FXML private TextField nom;
	@FXML private TextField cognoms;
	@FXML private TextField correu;
	@FXML private PasswordField contrasenya;
	@FXML private PasswordField contrasenya2;
	@FXML private TextField poblacio;
	@FXML private DatePicker dataNaixement;
	@FXML private Label error;
	
	public void eixirRegistre (ActionEvent e) {
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
		nom.setText("");
        cognoms.setText("");
        correu.setText(null);
        contrasenya.clear();
        contrasenya2.clear();
        poblacio.setText(null);
        dataNaixement.setValue(null);
        error.setText("");
	}
	
	public void registrarUsuari (ActionEvent e) {
		try {
			String nomUsuari = nom.getText().trim();
	        String cognomsUsuari = cognoms.getText().trim();
	        String emailUsuari = correu.getText().trim();
	        String contrasenyaUsuari = contrasenya.getText().trim();
	        String contrasenyaUsuari2 = contrasenya2.getText().trim();
	        String poblacioUsuari = poblacio.getText().trim();
	        String dataNaixementUsuari = dataNaixement.getValue().toString();

			error.setStyle("-fx-text-fill: red;");
	        if (nomUsuari.isEmpty() || cognomsUsuari.isEmpty() || emailUsuari.isEmpty() || contrasenyaUsuari.isEmpty() || contrasenyaUsuari2.isEmpty() || poblacioUsuari.isEmpty() || dataNaixementUsuari == null) {
	        	error.setText("Tots els camps són obligatoris");
	        } else if (!emailUsuari.matches("^[a-z0-9]+@[a-z]+\\.[a-z]+$")) {
	        	error.setText("El format del correu electrònic no es vàlid");
	        } else if (!contrasenyaUsuari.toString().equals(contrasenyaUsuari2.toString())) {
	        	error.setText("Les contrasenyes no son iguals");
	        } else if (contrasenyaUsuari.length() < 8) {
	        	error.setText("La contrasenya ha de tindre al menys 8 caràcters");
	        } else if (!contrasenyaUsuari.matches(".*[a-z].*[a-z].*")) {
	        	error.setText("La contrasenya ha de tindre al menys 2 minúscules");
	        } else if (!contrasenyaUsuari.matches(".*[A-Z].*[A-Z].*")) {
	        	error.setText("La contrasenya ha de tindre al menys 2 majúscules");
	        } else if (!contrasenyaUsuari.matches(".*\\d.*\\d.*")) {
	        	error.setText("La contrasenya ha de tindre al menys 2 digits");
	        } else {
	            try {
	            	Class.forName("org.mariadb.jdbc.Driver");
	    			
	    			String urlBaseDades = "jdbc:mysql://localhost:3306/Equip2PI";
	    			String usuari = "root";
	    			String contrasenya = "";
	    			
	            	Connection c = DriverManager.getConnection(urlBaseDades , usuari, contrasenya);
	    			Statement s = c.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
	    			s.executeUpdate("INSERT INTO Usuari (Nom, Email, Contrasenya, DataNaixement, Poblacio, Cognom, Rol) VALUES ('" + nomUsuari + "', '" + emailUsuari + "', '" + contrasenyaUsuari + "', '" + dataNaixementUsuari + "', '" + poblacioUsuari + "', '" + cognomsUsuari + "', 'ROL_USUARI')");
	    			error.setStyle("-fx-text-fill: green;");
	    			error.setText("Dades guardades correctament a la base de dades");
	    			
	    			Parent root2 = FXMLLoader.load(getClass().getResource("/vistes/VistaLogin.fxml"));
	    			Scene escena2 = new Scene(root2);
	    			Stage window = (Stage) ((Node) e.getSource()).getScene().getWindow();
	    			window.setScene(escena2);
	    			window.setTitle("Login");
	    			window.show();
	            } catch (Exception e3) {
					error.setStyle("-fx-text-fill: red;");
					error.setText("Ha ocurrit un error inesperat, avisa al programador xd");
//					System.out.println("Error: " + e3);
				}
	        }
		} catch (Exception e2) {
			error.setStyle("-fx-text-fill: red;");
			error.setText("Tots els camps són obligatoris");
		}
		
	}
	
}