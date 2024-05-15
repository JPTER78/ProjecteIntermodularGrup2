package application;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javafx.application.Application;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.scene.text.TextAlignment;
import javafx.stage.Stage;

public class AppUltimasPeliculas extends Application {
	
	private Label lblInici;
	private Label lblPeliculas;
	private Label lblSeries;
	private Button btnTancar;
	private GridPane grid;
	private HBox btnBox;
	private HBox hBoxLogo;
	private HBox hBoxFiltro;
	private HBox hBoxPeliculesSeries;
	private HBox hBoxTituls;
	private VBox vBoxVisualitzarPelicules;
	private VBox vBoxVisualitzarSeries;
	private VBox mainLayout;

    @Override
    public void start(Stage primaryStage) {
    	try {
    		// Crear etiquetas
    		lblInici = new Label("Benvingut a l'aplicació.");
    		lblPeliculas = new Label("Peliculas");
    		lblPeliculas.setFont(new Font(30));
        	lblPeliculas.setAlignment(javafx.geometry.Pos.CENTER);
    		lblSeries = new Label("Series");
    		lblSeries.setFont(new Font(30));
        	lblSeries.setAlignment(javafx.geometry.Pos.CENTER);
        	
        	// Botones
        	btnTancar = new Button("Tancar");
        	
        	// Manejo de eventos
        	btnTancar.setOnAction(e -> primaryStage.close());
        	
        	// Layout
        	grid = new GridPane();
        	grid.setVgap(10);
        	grid.setHgap(10);
        	grid.addRow(0, lblInici);
        	
        	// Botones
        	btnBox = new HBox(10, btnTancar);
        	btnBox.setStyle("-fx-padding: 10px;");
        	btnBox.setAlignment(javafx.geometry.Pos.CENTER);
        	
        	// HBox
        	hBoxLogo = new HBox();
        	hBoxFiltro = new HBox();
        	hBoxTituls = new HBox(lblPeliculas, lblSeries);
        	hBoxTituls.setSpacing(50);
        	hBoxTituls.setAlignment(javafx.geometry.Pos.CENTER);
        	
        	// VBox
        	vBoxVisualitzarPelicules = new VBox();
        	vBoxVisualitzarPelicules = carregarVBox("Peliculas", vBoxVisualitzarPelicules);
        	vBoxVisualitzarPelicules.setAlignment(javafx.geometry.Pos.TOP_LEFT);
        	vBoxVisualitzarSeries = new VBox();
        	vBoxVisualitzarSeries = carregarVBox("Series", vBoxVisualitzarSeries);
        	vBoxVisualitzarSeries.setAlignment(javafx.geometry.Pos.TOP_RIGHT);
        	
        	// HBox de VBox
        	hBoxPeliculesSeries = new HBox(vBoxVisualitzarPelicules, vBoxVisualitzarSeries);
        	hBoxPeliculesSeries.setSpacing(50);
        	hBoxPeliculesSeries.setAlignment(javafx.geometry.Pos.CENTER);
        	
        	// Slider
        	ScrollPane scrollPane = new ScrollPane(hBoxPeliculesSeries);
        	
        	// Main layout
        	mainLayout = new VBox(10, grid, hBoxTituls, scrollPane, btnBox);
        	mainLayout.setStyle("-fx-padding: 10px;");
        	
        	Scene scene = new Scene(mainLayout, 1600, 850);
        	primaryStage.setScene(scene);
        	primaryStage.setTitle("Movie Rater APP");
        	primaryStage.show();
    	} catch (Exception e) {
			System.out.println(e);
		}
    }

    public VBox carregarVBox(String tipo, VBox vBox) {
    	try {
    		Class.forName("org.mariadb.jdbc.Driver");
			
			String urlBaseDades = "jdbc:mysql://localhost:3306/Equip2PI";
			String usuari = "root";
			String contrasenya = "";
			
			Connection c = DriverManager.getConnection(urlBaseDades , usuari, contrasenya);
			Statement s = c.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
			ResultSet r = s.executeQuery("SELECT * FROM " + tipo);
			
			if (tipo == "Peliculas") {
				while (r.next()) {
					Rectangle rectangle = new Rectangle(50, 20, 500, 200);
					rectangle.setFill(Color.LIGHTBLUE);
					
					Text text = new Text(r.getString("NomPeli") + " [" + r.getString("Any") + "]\n" + r.getString("Sinopsi") + "\nDuració: " + r.getString("Durada(H)") + " hores.");
					text.setFont(new Font(15));
			        
					double textX = rectangle.getX() + (rectangle.getWidth() - text.getLayoutBounds().getWidth()) / 2;
					double textY = rectangle.getY() + (rectangle.getHeight() + text.getLayoutBounds().getHeight()) / 2;
					text.setX(textX);
					text.setY(textY);
					text.setTextAlignment(TextAlignment.LEFT);
			        
					Pane root = new Pane();
			        root.getChildren().addAll(rectangle, text);
					vBox.getChildren().add(root);
				}
			} else {
				while (r.next()) {
					Rectangle rectangle = new Rectangle(50, 20, 500, 200);
					rectangle.setFill(Color.LIGHTBLUE);
					
					Text text = new Text(r.getString("NomSerie") + " [" + r.getString("Any") + "]\n" + r.getString("Sinopsi") + "\nTemporades: " + r.getString("Temporades") + " | Duració: " + r.getString("Durada(H)") + " hores.");
					text.setFont(new Font(15));
			        
			        double textX = rectangle.getX() + (rectangle.getWidth() - text.getLayoutBounds().getWidth()) / 2;
					double textY = rectangle.getY() + (rectangle.getHeight() + text.getLayoutBounds().getHeight()) / 2;
					text.setX(textX);
					text.setY(textY);
					text.setTextAlignment(TextAlignment.LEFT);
			        
					Pane root = new Pane();
			        root.getChildren().addAll(rectangle, text);
					vBox.getChildren().add(root);
				}
			}
			vBox.setSpacing(50);
		} catch (Exception e) {
			System.out.println(e);
		}
    	return vBox;
    }
    
    public static void main(String[] args) {
        launch(args);
    }
}