jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  balance.setupForm()

balance =
  setupForm: ->
    $('#new_balance').submit ->
      $('input[type=submit]').attr('disabled', true)
      balance.processCard()
      false
    else
      true

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, balance.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
        $('#balance_stripe_card_token').val(response.id)
        $('#new_balance')[0].submit()
      else
        $('#stripe_error').text(response.error.message)
        $('input[type=submit]').attr('disabled', false)