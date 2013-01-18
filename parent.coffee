radioMap = {} # WARNING: global variables for .parent multiple data
$.fn.extend
  #
  # WARNING
  #   markup 에서 <div class="parent" data="key:['1']">
  #   요걸 조심해야.. `'` 붙으면 문자열이고, 안붙이면 정수형임
  #   _.indexOf 에서 타입이 달라서 의도한대로 동작안함
  #
  radioch: ->
    this.change ->
      name = $(this).attr "name"
      val = $(this).val()
      isChecked = $(this).is ":checked"
      radioMap[name] = true if isChecked
      $('.parent').each (e, el) ->
        $el = $(el)
        meta = $el.metadata { type: 'attr', name: 'data' }
        if meta.name is name
          if _.indexOf(meta.value, val) isnt -1
            if isChecked
              $el.enable().show()
            else if radioMap[name]
              # do nothing
            else
              $el.disable().hide()
          else
            $el.disable().hide() if isChecked
    .change()

    if @parent().get(0)?.tagName?.toLowerCase() is 'label'
      @parent().mouseenter ->
        if $(@).find(':radio').is(':checked') then $(@).bind('click', remove_check)
      @parent().mouseleave ->
        $(@).unbind 'click', remove_check

    remove_check = ->
      $radio = $(@).find(':radio')
      $radio.removeAttr('checked')
      name = $radio.attr 'name'
      val  = $radio.val()
      $('.parent').each (e, el) ->
        $el = $(el)
        meta = $el.metadata { type: 'attr', name: 'data' }
        if meta.name is name
          if _.indexOf(meta.value, val) isnt -1
            $el.disable().hide()
        unless $("input[name=#{meta.name}]").is(':visible')
          $el.disable().hide()
    @

  checkboxch: ->
    this.change ->
      name = $(this).attr "name"
      val = $(this).val()
      isChecked = $(this).is ":checked"
      $('.parent').each (e, el) ->
        $el = $(el)
        meta = $el.metadata { type: 'attr', name: 'data' }
        if meta.name is name
          if _.indexOf(meta.value, val) isnt -1
            if isChecked then $el.enable().show() else $el.disable().hide()
          else
            $el.disable().hide() if isChecked
    .change()
    @

$(document).ready ->
  $(':radio').radioch()
  $(':checkbox').checkboxch()
  $(':radio,:checkbox').on 'change', ->
    $('.parent:visible').each (e, el) ->
      $el = $(el)
      meta = $el.metadata { type: 'attr', name: 'data' }
      unless $("input[name=#{meta.name}]").is(':visible')
        $el.disable().hide()
