module  GameAnnouncementsHelper
  
  # selection for block type
  def block_type_select
    return collection_select(:game, :game_block_id, block_type_lookup, :value,:label,{:prompt=> t(:block_type_select_filter)})
  end
  
  
  def game_language_select
    return collection_select(:game, :game_language, game_language_lookup, :value,:label,{:prompt=> t(:game_language_select_filter)})
  end
  
  
  private
  
  def block_type_lookup
    block_type_ar = Array.new()
    
    @event.game_blocks.each.each do |game_block| 
       y = LabelValue.new
       y.label = t("#{game_block.title}_filter_select_list").to_sym
       y.value = game_block.id
       block_type_ar.push(y)
    end
      
    return block_type_ar
    
  end
  
  def game_language_lookup
    block_type_ar = Array.new()
    
    y = LabelValue.new; y.label = t(:en_select_list); y.value = "en"; block_type_ar.push(y)
    y = LabelValue.new; y.label = t(:de_select_list); y.value = "de"; block_type_ar.push(y)
    y = LabelValue.new; y.label = t(:fr_select_list); y.value = "fr"; block_type_ar.push(y)
    y = LabelValue.new; y.label = t(:other_lang_select_list); y.value = "other"; block_type_ar.push(y)
    
    return block_type_ar
  end
end