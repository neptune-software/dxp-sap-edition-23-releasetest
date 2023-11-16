var sorters = [];
var asc = (pageListFilterInputOrder.getSelectedKey() === "DESC");
var binding = TabData.getBinding("items");

if (pageListFilterInputGroup.getSelectedKey()) sorters.push(new sap.ui.model.Sorter(pageListFilterInputGroup.getSelectedKey(), asc, true));
if (pageListFilterInputSort.getSelectedKey()) sorters.push(new sap.ui.model.Sorter(pageListFilterInputSort.getSelectedKey(), asc, false));
binding.sort(sorters);