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
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.layout.VBox;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

public class VistaAplicacioBaseController {
	
	@FXML private VBox root;
	@FXML private Label fitxer;
	@FXML private VBox fitxerDesplegable;
	@FXML private Label edita;
	@FXML private VBox editaDesplegable;
	@FXML private Label visualitza;
	@FXML private VBox visualitzaDesplegable;
	
	public void mostrarFitxer() {
		if (fitxerDesplegable.isVisible()) {
			fitxerDesplegable.setVisible(false);
		} else {
			fitxerDesplegable.setVisible(true);
		}
	}
	
	public void mostrarEdita() {
		if (editaDesplegable.isVisible()) {
			editaDesplegable.setVisible(false);
		} else {
			editaDesplegable.setVisible(true);
		}
	}

	public void mostrarVisualitza() {
		if (visualitzaDesplegable.isVisible()) {
			visualitzaDesplegable.setVisible(false);
		} else {
			visualitzaDesplegable.setVisible(true);
		}
	}
	
	public void alumbrar() {
		fitxer.setTextFill(Color.web("#d3d3d3"));
	}

	public void deslumbrar() {
		fitxer.setTextFill(Color.web("#a1a1a1"));
	}
	
}