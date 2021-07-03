var card;
var stripe;
var language;
var uid;
var errorContainer;

var stripeTestKey = "pk_test_dT9TOTIDB0AkMT3AC9CeqH6n00jnr2GRkN";

function stripeInit() {

    stripe = Stripe(stripeTestKey, {
        locale: "en",
    });
}

function mountCard(cardElement, cardErrors) {

    errorContainer = cardErrors;

    // Attaching elements
    let elements = stripe.elements();
    console.log(card);
    card = elements.create('card');
    card.mount(cardElement);
    
    // Handling events
    card.on('change', (event) => {
        if (event.error) {
            errorContainer.innerHTML = "<p style='font-size: 10px; margin: 0px;'>" + event.error.message + "</p>";
        } else {
            errorContainer.innerHTML = ""; 
        }
    });
    
    return card;
}