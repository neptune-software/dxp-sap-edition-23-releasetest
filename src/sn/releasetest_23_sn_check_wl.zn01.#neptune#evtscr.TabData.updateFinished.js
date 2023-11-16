var bindingItems = TabData.getBinding("items");

// Length Counter
pageListHeaderNumber.setText("(" + bindingItems.iLength + ")");

// Destroy Items
pageListFilterInputSort.destroyItems();
pageListFilterInputGroup.destroyItems();

pageListFilterInputSort.addItem(new sap.ui.core.Item({
    key: "",
    text: ""
}));
pageListFilterInputGroup.addItem(new sap.ui.core.Item({
    key: "",
    text: ""
}));

// Get unique binding name 
var bindingName = {};
$.each(bindingItems.oModel.aBindings, function(i, data) {
    if (!bindingName[data.sPath] && data.sPath.indexOf("/") === -1) {
        bindingName[data.sPath] = true;
        pageListFilterInputSort.addItem(new sap.ui.core.ListItem({
            key: data.sPath,
            text: data.sPath
        }));
        pageListFilterInputGroup.addItem(new sap.ui.core.ListItem({
            key: data.sPath,
            text: data.sPath
        }));
    }
});