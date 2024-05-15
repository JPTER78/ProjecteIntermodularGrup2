package controladors;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class VistaIniciProgramaController {

	@FXML private VBox root;
	@FXML private Button botoRegistre;
	@FXML private Button botoLogin;
	@FXML private Button botoEixir;
	
	public void entrarRegistre (ActionEvent e) {
		try {
			Parent root2 = FXMLLoader.load(getClass().getResource("/vistes/VistaRegistre.fxml"));
			Scene escena2 = new Scene(root2);
			Stage window = (Stage) ((Node) e.getSource()).getScene().getWindow();
			window.setScene(escena2);
			window.setTitle("Registre");
			window.show();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}
	
	public void entrarLogin (ActionEvent e) {
		try {
			Parent root2 = FXMLLoader.load(getClass().getResource("/vistes/VistaLogin.fxml"));
			Scene escena2 = new Scene(root2);
			Stage window = (Stage) ((Node) e.getSource()).getScene().getWindow();
			window.setScene(escena2);
			window.setTitle("Login");
			window.show();
		} catch (IOException e1) {
			 e1.printStackTrace();
		}
	}
	
	public void eixirAplicacio (ActionEvent e) {
		Stage window = (Stage) ((Node) e.getSource()).getScene().getWindow();
		window.close();
	}
	
}