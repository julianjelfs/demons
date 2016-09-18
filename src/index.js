require('./main.css');

var Elm = require('./Main.elm');

var root  = document.getElementById('root');

var app = Elm.Main.embed(root);

//load children from local storage and then pipe into the storage port

debugger;
app.ports.storage.send({
    children: [{
        name: 'Alfie',
        balance: 10
    }, {
        name: 'Daisy',
        balance: 5
    }, {
        name: 'Orry',
        balance: -6
    }]
});