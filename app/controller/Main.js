Ext.define('sanghaSupporter.controller.Main', {
    extend: 'Ext.app.Controller',

  stores: [
      'Filter',
      'Supporter'
  ],
    
    views: [
        'filters.Tree',
        'supporter.Grid',
        'supporter.Form'
    ],
    
    refs: [{
         ref: 'supporterForm',
         selector: 'supporterform'
     },{
         ref: 'supporterGrid',
         selector: 'supportergrid'
     }],
    
    init: function() {
        this.control({
            'filterstree': {
                selectionchange: this.applyFilter
            },
            'supportergrid': {
                selectionchange: this.gridSelectionChange,
                viewready: this.onViewReady
            }                       
        });
    },        
    applyFilter: function(n, records) {
        var selectedFilters = records[0].data.filters;
        this.getSupporterStore().clearFilter();
        
        if (selectedFilters !== null) {
            this.getSupporterStore().filter(selectedFilters);
        }
    },
    gridSelectionChange: function(model, records) {
        
        if (records[0]) {
            this.getSupporterForm().loadRecord(records[0]);
        }
    },
    onViewReady: function(grid) {
        grid.getSelectionModel().select(0);
    }       
});