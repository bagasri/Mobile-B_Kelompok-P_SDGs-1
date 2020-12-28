import 'package:flutter/material.dart';
import 'package:findjobs/ui/theme/theme.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key key, this.isFullTime, this.onSearchTap, this.controller}) : super(key: key);
  final ValueNotifier<bool> isFullTime;
  final Function(String) onSearchTap;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: theme.cardColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.location_pin, color: theme.primaryColor),
              SizedBox(width: 10),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: InputBorder.none, hintText: "Filter Kota dan Kabupaten"),
              ).extended
            ],
          ).p(12),
          Divider(height: 1),
          SizedBox(height: 8),
          ValueListenableBuilder<bool>(
            valueListenable: isFullTime,
            builder: (BuildContext context, bool value, Widget child) {
              return CheckboxListTile(
                value: value,
                activeColor: theme.primaryColor,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (val) {
                  isFullTime.value = val;
                },
                title: Text(
                  "Full Time",
                  style: theme.textTheme.headline6.copyWith(fontSize: 16),
                ),
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(5)),
            child: Text(
              "Cari",
              style: theme.textTheme.button.copyWith(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
            ),
          ).ripple(() {
            onSearchTap(controller.text);
            Navigator.pop(context);
            controller.clear();
          }).p16,
        ],
      ),
    );
  }
}