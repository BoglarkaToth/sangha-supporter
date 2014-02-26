Ext.define('sanghaSupporter.store.Filter', {
    extend: 'Ext.data.TreeStore',

    model: 'sanghaSupporter.model.Filter',

    root: {
        expanded: false,
        children: [{
            text: "Buddhisták",
            filters: null,
            expanded: true,
            children: [{
                    text: "Mind",
                    filters: null,
                    leaf: true
    }, {
                    text: "Pártolók",
                    filters: [{
                        property: 'status',
                        value: 'supporter'
                }],
                    leaf: true
    }, {
                    text: "Tagok",
                    filters: [{
                        property: 'status',
                        value: 'member'
                }],
                    leaf: true
    },{
                    text: "Inaktív",
                    filters: [{
                        property: 'status',
                        value: 'inactive'
                }],
                    leaf: true
    }]
        }]
    }
});