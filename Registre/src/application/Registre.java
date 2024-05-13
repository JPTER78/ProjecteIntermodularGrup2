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

public class Registre extends Application {

    private TextField txtNom, txtCognoms, txtEmail, txtContrasenya, txtContrasenya2, txtPoblacio;
    private DatePicker datePicker;
    private Label lblError;

    @Override
    public void start(Stage primaryStage) {
        // Crear campos de entrada
        txtNom = new TextField();
        txtCognoms = new TextField();
        txtEmail = new TextField();
        txtContrasenya = new PasswordField();
        txtContrasenya2 = new PasswordField();
        txtPoblacio = new TextField();
        datePicker = new DatePicker();

        // Crear etiquetas
        Label lblNom = new Label("Nom:");
        Label lblCognoms = new Label("Cognoms:");
        Label lblEmail = new Label("Correu electrònic:");
        Label lblContrasenya = new Label("Contrasenya:");
        Label lblContrasenya2 = new Label("Repeteix contrasenya:");
        Label lblPoblacio = new Label("Població:");
        Label lblDataNaixement = new Label("Data de naixement:");
        Label lblCicle = new Label("Cicle formatiu:");

        // Botones
        Button btnTancar = new Button("Tancar");
        Button btnEsborrar = new Button("Esborrar");
        Button btnGuardar = new Button("Registrar-se");

        // Manejo de eventos
        btnTancar.setOnAction(e -> primaryStage.close());
        btnEsborrar.setOnAction(e -> esborrarFormulari());
        btnGuardar.setOnAction(e -> registrarUsuari());

        // Layout
        GridPane grid = new GridPane();
        grid.setVgap(10);
        grid.setHgap(10);
        grid.addRow(0, lblNom, txtNom);
        grid.addRow(1, lblCognoms, txtCognoms);
        grid.addRow(2, lblEmail, txtEmail);
        grid.addRow(3, lblContrasenya, txtContrasenya);
        grid.addRow(4, lblContrasenya2, txtContrasenya2);
        grid.addRow(5, lblPoblacio, txtPoblacio);
        grid.addRow(6, lblDataNaixement, datePicker);

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
        primaryStage.setTitle("Registre");
        primaryStage.show();
    }

    private void esborrarFormulari() {
        txtNom.clear();
        txtCognoms.clear();
        txtEmail.clear();
        txtContrasenya.clear();
        txtContrasenya2.clear();
        txtPoblacio.clear();
        datePicker.setValue(null);
        lblError.setText("");
    }

    private void registrarUsuari() {
        String nomUsuari = txtNom.getText().trim();
        String cognomsUsuari = txtCognoms.getText().trim();
        String emailUsuari = txtEmail.getText().trim();
        String contrasenyaUsuari = txtContrasenya.getText().trim();
        String contrasenyaUsuari2 = txtContrasenya2.getText().trim();
        String poblacioUsuari = txtPoblacio.getText().trim();
        String dataNaixementUsuari = datePicker.getValue().toString();

        if (nomUsuari.isEmpty() || cognomsUsuari.isEmpty() || emailUsuari.isEmpty() || contrasenyaUsuari.isEmpty() || contrasenyaUsuari2.isEmpty() || poblacioUsuari.isEmpty() || dataNaixementUsuari == null) {
            lblError.setText("Tots els camps són obligatoris");
        } else if (!emailUsuari.matches("^[a-z0-9]+@[a-z]+\\.[a-z]+$")) {
        	lblError.setText("El format del correu electrònic no es vàlid");
        } else if (!contrasenyaUsuari.toString().equals(contrasenyaUsuari2.toString())) {
        	lblError.setText("Les contrasenyes no son iguals");
        } else if (contrasenyaUsuari.length() < 8) {
        	lblError.setText("La contrasenya ha de tindre al menys 8 caràcters");
        } else if (!contrasenyaUsuari.matches(".*[a-z].*[a-z].*")) {
        	lblError.setText("La contrasenya ha de tindre al menys 2 minúscules");
        } else if (!contrasenyaUsuari.matches(".*[A-Z].*[A-Z].*")) {
        	lblError.setText("La contrasenya ha de tindre al menys 2 majúscules");
        } else if (!contrasenyaUsuari.matches(".*\\d.*\\d.*")) {
        	lblError.setText("La contrasenya ha de tindre al menys 2 digits");
        } else {
            try {
            	Class.forName("org.mariadb.jdbc.Driver");
    			
    			String urlBaseDades = "jdbc:mysql://localhost:3306/Equip2PI";
    			String usuari = "root";
    			String contrasenya = "";
    			
            	Connection c = DriverManager.getConnection(urlBaseDades , usuari, contrasenya);
    			Statement s = c.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
    			s.executeUpdate("INSERT INTO Usuari (Nom, Email, Contrasenya, DataNaixement, Poblacio, Cognom, Rol) VALUES ('" + nomUsuari + "', '" + emailUsuari + "', '" + contrasenyaUsuari + "', '" + dataNaixementUsuari + "', '" + poblacioUsuari + "', '" + cognomsUsuari + "', 'ROL_USUARI')");
            	lblError.setStyle("-fx-text-fill: green;");
            	lblError.setText("Dades guardades correctament a la base de dades");
			} catch (Exception e) {
				lblError.setStyle("-fx-text-fill: red;");
            	lblError.setText("Ha ocurrit un error");
			}
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}