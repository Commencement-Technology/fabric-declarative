package com.fabricdeclarative

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.ArrowDropDown
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.DropdownMenu
import androidx.compose.material3.Icon
import androidx.compose.material3.Text
import androidx.compose.material3.TextButton
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

@Composable
fun JetpackComposeView() {

  Column (
    Modifier
      .fillMaxWidth()
      .fillMaxHeight(),
    horizontalAlignment = Alignment.CenterHorizontally,
    verticalArrangement = Arrangement.Center,
  ) {

    Card (modifier = Modifier.fillMaxWidth(0.9f)) {
      Column (
        Modifier.padding(vertical = 15.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
      ) {
        var isDropdownDisplayed by remember { mutableStateOf(false) }

        Text(text = "Title")

        Row {
          TextField(
            value = "Input",
            onValueChange = {  },
            modifier = Modifier.weight(1f)
          )
        }


        Spacer(
          modifier = Modifier.height(15.dp)
        )

        Box (modifier = Modifier.fillMaxWidth(0.9f)) {
          TextButton (
            onClick = { isDropdownDisplayed = true }
          ) {
            Text(text = "Number", modifier = Modifier.weight(1f))
            Icon(Icons.Default.ArrowDropDown, contentDescription = "dropdown")
          }

          DropdownMenu(
            modifier = Modifier.fillMaxWidth(0.8f),
            expanded = isDropdownDisplayed,
            onDismissRequest = { isDropdownDisplayed = false }
          ) {
            for (option in intArrayOf(1,2,3)) {
              TextButton(
                modifier = Modifier.fillMaxWidth(),
                onClick = {  }
              ) {
                Text("Option: ${option}")
              }
            }
          }
        }


        Spacer(
          modifier = Modifier.height(15.dp)
        )

        Button(
          onClick = {  }
        ) {
          Text(text = "Submit")
        }

      }
    }
  }
}

@Preview(showBackground = true)
@Composable
private fun JetpackComposeViewPreview() {
  JetpackComposeView()
}
