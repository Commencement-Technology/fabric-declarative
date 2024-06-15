package com.fabricdeclarative

import com.facebook.react.bridge.ReadableArray
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.FabricDeclarativeViewManagerInterface
import com.facebook.react.viewmanagers.FabricDeclarativeViewManagerDelegate
import com.facebook.react.common.MapBuilder

@ReactModule(name = FabricDeclarativeViewManager.NAME)
class FabricDeclarativeViewManager : SimpleViewManager<FabricDeclarativeView>(),
  FabricDeclarativeViewManagerInterface<FabricDeclarativeView> {
  private val mDelegate: ViewManagerDelegate<FabricDeclarativeView>

  init {
    mDelegate = FabricDeclarativeViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<FabricDeclarativeView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): FabricDeclarativeView {
    return FabricDeclarativeView(context)
  }

  companion object {
    const val NAME = "FabricDeclarativeView"
  }

  @ReactProp(name = "title")
  override fun setTitle(view: FabricDeclarativeView?, value: String?) {
    view?.viewModel?.updateTitle(value ?: "")
  }

  @ReactProp(name = "options")
  override fun setOptions(view: FabricDeclarativeView?, value: ReadableArray?) {
    if(value == null) {
      return
    }

    view?.viewModel?.updateOptions(value.toArrayList() as ArrayList<Double>)
  }

  override fun getExportedCustomDirectEventTypeConstants(): MutableMap<String, Any> = mutableMapOf(
    SubmitEvent.EVENT_NAME to MapBuilder.of("registrationName", "onSubmit")
  )

}
