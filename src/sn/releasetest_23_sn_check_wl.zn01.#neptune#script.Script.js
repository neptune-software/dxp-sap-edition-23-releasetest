sap.ui.getCore().attachInit(function(data, navObj) {

    var arrayData = [{
        KUNNR: "1000000005",
        NAME1_GP: "Citibank",
        ORT1: "Hamburg"
    },{
        KUNNR: "1000000006",
        NAME1_GP: "Enterprise",
        ORT1: "München"
    },{
        KUNNR: "0000000617",
        NAME1_GP: "US Industrial",
        ORT1: "Newton"
    },{
        KUNNR: "0000001007",
        NAME1_GP: "Pharma AG",
        ORT1: "Frankfurt"
    },{
        KUNNR: "0000001098",
        NAME1_GP: "Productos Argentinos Imp",
        ORT1: "Buenos Aires"
    }];
    modelTabData.setData(arrayData);

    pageListFilterInputSearch.onAfterRendering = function(e) {
        setTimeout(function() {
            pageListFilterInputSearch.rerender();
        });
    };
});



