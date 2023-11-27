/**
 * @function - Custom Init, happens only once
 * @param {Object} data - Only for View. Start parameters from Tile/Tilegroup Action settings, or params from hash navigation
 * @param {Object} navObj - Only for View. Change title & subtitle on navigation item in left side menu dynamically
 * @param {Function} navObj.updateNavigationItemFn - Update title & subtitle on navigation item
 */
// Model Application Control
// new line
var appControl = new sap.ui.model.json.JSONModel();

appControl.setData({
    expandable: true,
    headerText: "appControl Text",
    nestedTable: [{
        comp1: "Row 1 Comp 1",
        comp2: "Row 1 Comp 2",
    }, {
        comp1: "Row 2 Comp 1",
        comp2: "Row 2 Comp 2",
    }]
});

oApp.setModel(appControl, "appControl");

sap.ui.getCore().attachInit(function(data, navObj) {
    getOnlineoPanelApplClass();
    //getOnlineMS_MMODEL1();
    setTimeout(function() {
      //  getOnlineoAjApplCMSG();
      //  getODataoTabOData();
    }, 1000);
});


function deserialize(json) {

    if (json === undefined || json === null) {
        return json;
    }

    var newJson = JSON.parse(JSON.stringify(json));

    if (Array.isArray(newJson) && isJSONH(newJson)) {

        newJson = JSONH.unpack(newJson);
        newJson = deserialize2(newJson);

    } else {

        for (var property in newJson) {
            if (Array.isArray(newJson[property])) {
                if (isJSONH(newJson[property])) {
                    newJson[property] = JSONH.unpack(newJson[property]);
                    newJson[property] = deserialize2(newJson[property]);
                } else {
                    newJson[property] = deserialize2(newJson[property])
                }
            } else if (typeof newJson[property] === "object") {
                newJson[property] = deserialize2(newJson[property])
            }
            // console.log(`${property}: ${obj[property]}`);
        }
    }
    return newJson;

}

function isJSONH(json) {
    // debugger;
    if (typeof json[0] === "number") {
        for (var i = 1; i <= json[0]; i++) {
            if (typeof json[i] !== "string") {
                return false;
            };
        }
        return true;
    } else {
        return false;
    }
}
