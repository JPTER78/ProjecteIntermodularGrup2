package application;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.Stage;

import java.awt.event.ActionEvent;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;

public class MenuInici extends Application {

    @Override
    public void start(Stage primaryStage) {

        // Crear etiquetas
        Label lblInici = new Label("Benvingut a l'aplicació.");

        // Botones
        Button btnTancar = new Button("Tancar");
        Button btnRegistre = new Button("Registre");

        // Manejo de eventos
        btnTancar.setOnAction(e -> primaryStage.close());
        btnRegistre.setOnAction(e -> carregarRegistre());

        // Layout
        GridPane grid = new GridPane();
        grid.setVgap(10);
        grid.setHgap(10);
        grid.addRow(0, lblInici);

        // Botones
        HBox btnBox = new HBox(10, btnTancar, btnRegistre);
        btnBox.setStyle("-fx-padding: 10px;");
        btnBox.setAlignment(javafx.geometry.Pos.CENTER);

        // Main layout
        VBox mainLayout = new VBox(10, grid, btnBox);
        mainLayout.setStyle("-fx-padding: 10px;");

        Scene scene = new Scene(mainLayout, 400, 350);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Formulari de Dades");
        primaryStage.show();
    }
    
    public void carregarRegistre() {
    	System.out.println("Entrar registre");
    }

    public static void main(String[] args) {
        launch(args);
    }
}