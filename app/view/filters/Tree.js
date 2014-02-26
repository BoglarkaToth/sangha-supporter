Ext.define('sanghaSupporter.view.filters.Tree' ,{
    extend: 'Ext.tree.Panel',
    alias: 'widget.filterstree',

    title: 'Szűrők',    

    store: 'Filter',
    
    rootVisible: false,
    
    initComponent: function() {
        this.callParent(arguments);
    }
});