jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  balance.setupForm()

balance =
  setupForm: ->
    $('#new_balance').submit ->
      $('input[type=submit]').attr('disabled', true)
      balance.processCard()

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, balance.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      alert(response.id)
    else
         alert(response.error.message)