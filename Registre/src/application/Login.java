package application;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.Stage;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;

public class Login extends Application {

    private TextField txtEmail, txtContrasenya;
    private Label lblError;

    @Override
    public void start(Stage primaryStage) {
        // Crear campos de entrada
        txtEmail = new TextField();
        txtContrasenya = new PasswordField();

        // Crear etiquetas
        Label lblEmail = new Label("Correu electrònic:");
        Label lblContrasenya = new Label("Contrasenya:");

        // Botones
        Button btnTancar = new Button("Tancar");
        Button btnEsborrar = new Button("Esborrar");
        Button btnGuardar = new Button("Logear-se");

        // Manejo de eventos
        btnTancar.setOnAction(e -> primaryStage.close());
        btnEsborrar.setOnAction(e -> esborrarFormulari());
        btnGuardar.setOnAction(e -> logearUsuari());

        // Layout
        GridPane grid = new GridPane();
        grid.setVgap(10);
        grid.setHgap(10);
        grid.addRow(2, lblEmail, txtEmail);
        grid.addRow(3, lblContrasenya, txtContrasenya);

        // Error label
        lblError = new Label();
        lblError.setStyle("-fx-text-fill: red;");

        // Botones
        HBox btnBox = new HBox(10, btnTancar, btnEsborrar, btnGuardar);
        btnBox.setStyle("-fx-padding: 10px;");
        btnBox.setAlignment(javafx.geometry.Pos.CENTER);

        // Main layout
        VBox mainLayout = new VBox(10, grid, lblError, btnBox);
        mainLayout.setStyle("-fx-padding: 10px;");

        Scene scene = new Scene(mainLayout, 400, 350);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Login");
        primaryStage.show();
    }

    private void esborrarFormulari() {
        txtEmail.clear();
        txtContrasenya.clear();
        lblError.setText("");
    }

    private void logearUsuari() {
        String emailUsuari = txtEmail.getText().trim();
        String contrasenyaUsuari = txtContrasenya.getText().trim();
        
        try {
        	Class.forName("org.mariadb.jdbc.Driver");
			
			String urlBaseDades = "jdbc:mysql://localhost:3306/Equip2PI";
			String usuari = "root";
			String contrasenya = "";
			
			Connection c = DriverManager.getConnection(urlBaseDades , usuari, contrasenya);
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
		        lblError.setStyle("-fx-text-fill: green;");
		        lblError.setText("Logeat correctament");
			} else {
		        lblError.setStyle("-fx-text-fill: red;");
				lblError.setText("Correu i/o contrasenya incorrectes");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
    }

    public static void main(String[] args) {
        launch(args);
    }
}