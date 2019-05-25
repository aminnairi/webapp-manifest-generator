var style = document.createElement('link');
var main = document.createElement('script');

style.href = 'index.css';
style.rel = 'stylesheet';

main.src = 'main.js';
main.async = true;

document.head.appendChild(style);
document.head.appendChild(main);

Promise.all([
    new Promise(function(resolve) {
        style.addEventListener('load', function() {
            resolve();
        });
    }),
    new Promise(function(resolve) {
        main.addEventListener('load', function() {
            resolve();
        });
    })
]).then(function() {
    window.addEventListener('load', function() {
        Elm.Main.init({
            node: document.getElementsByTagName('main')[0]
        });
    });
});
