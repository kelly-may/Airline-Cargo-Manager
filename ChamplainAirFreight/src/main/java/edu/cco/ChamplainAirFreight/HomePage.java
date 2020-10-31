package edu.cco.ChamplainAirFreight;

import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.control.Button;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.text.FontPosture;
import javafx.scene.text.FontWeight;
import javafx.scene.text.Text;

/**
 * * @Author Name: Kelly May
 * @Assignment Name: caf
 * @Date: Oct 28, 2020
 * @Subclass HomePage Description: This is all the code related to the HomePage
 * pane of the GUI
 */
//Begin Subclass HomePage
public class HomePage {

    // classes 
    Styles s = new Styles();

    //passed border pane from CAF. 
    BorderPane bPane = new BorderPane();

    //other pages to navigate to (classes) 
    ClientsPage clientsPage = new ClientsPage(bPane);
    FlightsPage flightsPage = new FlightsPage(bPane);
    ShipmentsPage shipPage = new ShipmentsPage(bPane);
    PilotPage pilotPage = new PilotPage(bPane);
    HelpPage helpPage = new HelpPage(bPane); //help/FAQ page 
    ContactPage contactPage = new ContactPage(bPane); //contact us page 

    /**
     * constructor pulls the borderpane
     */
    HomePage(BorderPane bp) {
        bPane = bp;
    }

    /**
     * getPane - this is the first page of CAF a use will see. Holds basic
     * navigation information. this is what the main CAF file will pull the
     * homePage from.
     *
     * @return
     */
    public VBox getPane() {
        VBox home = new VBox();
        home.getChildren().add(getAllButton());
        return home;
    }

    /**
     * getAllButton - method to get all the buttons for the home page
     *
     * @return
     */
    private HBox getAllButton() {
        HBox hboxall = new HBox();
        hboxall.getChildren().addAll(getCenterLeftButton(), getCenterMiddleButton(),
                getCenterRightButton());
        hboxall.setAlignment(Pos.CENTER);
        return hboxall;
    }

    /**
     * getCenterLeftButton - buttons for the home page
     *
     * @return
     */
    private VBox getCenterLeftButton() {
        VBox vboxcb = new VBox();
        vboxcb.setMaxSize(300, 220);
        Text cltext = new Text("Enter Client Information");//
        Text shiptext = new Text("Shipping Details");
        VBox.setMargin(cltext, new Insets(20, 0, 20, 20));
        VBox.setMargin(shiptext, new Insets(20, 0, 20, 20));
        Button bthomeclients = new Button("CLIENT");
        Button bthomeshipment = new Button("SHIPMENT");
        bthomeclients.setFont(Font.font("Time New Roman", FontWeight.BOLD,
                FontPosture.REGULAR, 30));
        bthomeshipment.setFont(Font.font("Time New Roman", FontWeight.BOLD,
                FontPosture.REGULAR, 30));
        bthomeclients.setStyle(s.button);
        bthomeshipment.setStyle(s.button);
        //vboxcb.setStyle("-fx-background-color: white");
        bthomeclients.setMinSize(250, 150);
        bthomeshipment.setMinSize(250, 150);
        vboxcb.getChildren().addAll(cltext, bthomeclients, shiptext, bthomeshipment);

        bthomeclients.setOnAction(e -> {
            bPane.setCenter(clientsPage.getPane());
        });

        bthomeshipment.setOnAction(e -> {
            // set bpane center to shipment page
            bPane.setCenter(shipPage.getPane());
        });

        return vboxcb;
    }

    /**
     * getCenterMiddleButton - central buttons for the home page.
     *
     * @return
     */
    private VBox getCenterMiddleButton() {
        VBox vboxcb = new VBox();
        vboxcb.setAlignment(Pos.CENTER);
        Text fltext = new Text("All Flight Records");
        Text hltext = new Text("Do You Have a Question?");
        vboxcb.setMargin(fltext, new Insets(20, 0, 20, 20));
        vboxcb.setMargin(hltext, new Insets(20, 0, 20, 20));
        Button bthomeflights = new Button("FLIGHTS");
        Button bthomehelp = new Button("HELP-FAQ PAGE");
        bthomeflights.setFont(Font.font("Time New Roman", FontWeight.BOLD,
                FontPosture.REGULAR, 30));
        bthomehelp.setFont(Font.font("Time New Roman", FontWeight.BOLD,
                FontPosture.REGULAR, 30));
        bthomeflights.setStyle(s.button);
        bthomehelp.setStyle(s.button);
        //vboxcb.setStyle("-fx-background-color: white");
        vboxcb.setMargin(bthomeflights, new Insets(0, 0, 0, 20));
        vboxcb.setMargin(bthomehelp, new Insets(0, 0, 0, 20));
        bthomeflights.setMinSize(250, 150);
        bthomehelp.setMinSize(250, 150);
        vboxcb.getChildren().addAll(fltext, bthomeflights, hltext, bthomehelp);

        bthomeflights.setOnAction(e -> {
            //set bpane center to flights
            bPane.setCenter(flightsPage.getPane());
        });

        bthomehelp.setOnAction(e -> {
            //set bpane center to help
            bPane.setCenter(helpPage.getPane());
        });

        return vboxcb;
    }

    /**
     * getCenterRightButton - right buttons for the home page
     *
     * @return
     */
    private VBox getCenterRightButton() {
        VBox vboxcb = new VBox();
        Text airtext = new Text("Aircraft Operations Info");
        Text contact = new Text("How to reach us");
        vboxcb.setMargin(airtext, new Insets(20, 0, 20, 20));
        vboxcb.setMargin(contact, new Insets(20, 0, 20, 20));
        Button bthomepilot = new Button("PILOT");
        Button bthomecontact = new Button("CONTACT US");
        bthomepilot.setFont(Font.font("Time New Roman", FontWeight.BOLD,
                FontPosture.REGULAR, 30));
        bthomecontact.setFont(Font.font("Time New Roman", FontWeight.BOLD,
                FontPosture.REGULAR, 30));
        bthomepilot.setStyle(s.button);
        bthomecontact.setStyle(s.button);
        //vboxcb.setStyle("-fx-background-color: white");
        vboxcb.setMargin(bthomepilot, new Insets(0, 0, 0, 20));
        vboxcb.setMargin(bthomecontact, new Insets(0, 0, 0, 20));
        bthomepilot.setMinSize(250, 150);
        bthomecontact.setMinSize(250, 150);
        vboxcb.getChildren().addAll(airtext, bthomepilot, contact, bthomecontact);

        bthomepilot.setOnAction(e -> {
            // set bpane cetner to pilot
            bPane.setCenter(pilotPage.getPane());
        });
        bthomecontact.setOnAction(e -> {
            // set bpane center to contact page
            bPane.setCenter(contactPage.getPane());
        });

        return vboxcb;
    }

} //End Subclass HomePage
