package application;

import java.io.IOException;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class Vista1Controller {

	@FXML private Button botoHola;
	@FXML private Button botoEscena;
	@FXML private VBox root;
	
	public void hola(ActionEvent e) {
		System.out.println("Hola");
		botoHola.setText("Adéu");
		root.setBackground(new Background(new BackgroundFill(Color.BLUE, null, null)));
	}
	
	public void escena(ActionEvent e) {
		 try {
			 Parent root2 = FXMLLoader.load(getClass().getResource("Vista2.fxml"));
			 Scene escena2 = new Scene(root2);
			 Stage window = (Stage) ((Node) e.getSource()).getScene().getWindow();
			 window.setScene(escena2);
			 window.setTitle("Escena 2");
			 window.show();
		 } catch (IOException e1) {
			 e1.printStackTrace();
		 }
	}
	
}