#include "mygstplugin.h"


G_DEFINE_TYPE(MyGstPlugin, gst_my_gst_plugin, GST_TYPE_ELEMENT);


static GstStaticPadTemplate sourceFactory =
  GST_STATIC_PAD_TEMPLATE("src", GST_PAD_SRC, GST_PAD_ALWAYS, GST_STATIC_CAPS("ANY"));



static void gst_my_gst_plugin_class_init(MyGstPluginClass *klass){
  GstElementClass *elementClass = GST_ELEMENT_CLASS(klass);

  gst_element_class_set_static_metadata(elementClass,
    "My gstreamer plugin",
    "For testing only",
    "Basic structure",
    "Phu Tran <ptran@axon.com>");


  gst_element_class_add_pad_template(elementClass,
    gst_static_pad_template_get(&sourceFactory));

}


static void gst_my_gst_plugin_init(MyGstPlugin * plugin){

}

static gboolean plugin_init(GstPlugin * plugin){
  return gst_element_register(plugin,
    "MyGstPlugin",
    GST_RANK_NONE,
    GST_TYPE_MY_GST_PLUGIN);
}

GST_PLUGIN_DEFINE(
  GST_VERSION_MAJOR,
  GST_VERSION_MINOR,
  MyGstPlugin,
  "My gstreamer plugin",
  plugin_init,
  VERSION,
  "LGPL",
  "Gstreamer",
  "https://gstreamer.net/"
)
