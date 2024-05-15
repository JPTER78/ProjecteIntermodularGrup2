package application;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.Stage;

public class MenuInici extends Application {

    @Override
    public void start(Stage primaryStage) {

        // Crear etiquetas
        Label lblInici = new Label("Benvingut a l'aplicació.");

        // Botones
        Button btnTancar = new Button("Tancar");
        Button btnRegistre = new Button("Registre");
        Button btnLogin = new Button("Login");

        // Manejo de eventos
        btnTancar.setOnAction(e -> primaryStage.close());
        btnRegistre.setOnAction(e -> carregarRegistre());
        btnLogin.setOnAction(e -> carregarLogin());

        // Layout
        GridPane grid = new GridPane();
        grid.setVgap(10);
        grid.setHgap(10);
        grid.addRow(0, lblInici);

        // Botones
        HBox btnBox = new HBox(10, btnTancar, btnRegistre, btnLogin);
        btnBox.setStyle("-fx-padding: 10px;");
        btnBox.setAlignment(javafx.geometry.Pos.CENTER);

        // Main layout
        VBox mainLayout = new VBox(10, grid, btnBox);
        mainLayout.setStyle("-fx-padding: 10px;");

        Scene scene = new Scene(mainLayout, 400, 350);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Movie Rater");
        primaryStage.show();
    }
    
    public void carregarRegistre() {
    	System.out.println("Entrar registre");
    }
    
    public void carregarLogin() {
    	System.out.println("Entrar login");
    }

    public static void main(String[] args) {
        launch(args);
    }
}