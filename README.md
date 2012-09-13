radiant-event-registration-extension
====================================

With this extension you can manage participant for a specific event/convention  Radiant is so freaking awesome, but I made it better through this extension. 

## To install 

The Extension requires the share_layouts extension

sudo git clone git://github.com/radiant/radiant-share-layouts-extension.git vendor/extensions/share_layouts/

git clone https://github.com/raebo/radiant-event-registration-extension.git vendor/extensions/event_registration/

rake radiant:extensions:event_registration:migrate
