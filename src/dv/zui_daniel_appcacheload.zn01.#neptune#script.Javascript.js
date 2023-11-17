// sap.ui.getCore().attachInit(function(data, navObj) {
    AppCache.Load("ZUI_DANIEL_DEMOAPP", {
        load: "external"
    }).then(view => {
        console.log("I got a JS view :)");
    }).catch(error => {
        console.error(error);
    });

// hi helder
    // debugger;
// });
