if (sap.n) {
    sap.ui.getCore().attachInit(function(data, navObj) {
        console.log("Hello Init Event!");
    });

    sap.n.Shell.attachBeforeDisplay(function(data, init) {
        console.log("Hello Before Display Event!");
    });
}