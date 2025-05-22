import 'package:flutter/material.dart';
import '../models/alaan_card_data.dart';
import 'components/google_pay_already_added_sheet.dart';
import 'components/gpay_screen_header.dart';
import 'components/card_list_item.dart';
import 'components/gpay_screen_actions.dart';

class GooglePayScreen extends StatefulWidget {
  const GooglePayScreen({super.key});

  @override
  State<GooglePayScreen> createState() => _GooglePayScreenState();
}

class _GooglePayScreenState extends State<GooglePayScreen> {
  String? _selectedCardId;

  final List<AlaanCardData> _cards = [
    AlaanCardData(
      id: 'card1',
      title: 'Tushar Sir Expenses',
      type: 'Physical',
      cardNumberSuffix: '3443',
      cardIconAssetPath: 'assets/images/smallCard0.png',
    ),
    AlaanCardData(
      id: 'card2',
      title: 'Rahul Sir Expenses',
      type: 'Virtual',
      cardNumberSuffix: '3443',
      cardIconAssetPath: 'assets/images/smallCard1.png',
    ),
    AlaanCardData(
      id: 'card3',
      title: 'Harshit Expenses',
      type: 'Virtual',
      cardNumberSuffix: '3443',
      cardIconAssetPath: 'assets/images/smallCard1.png',
    ),
    AlaanCardData(
      id: 'card4',
      title: 'Marketing Budget',
      type: 'Virtual',
      cardNumberSuffix: '1234',
      cardIconAssetPath: 'assets/images/smallCard1.png',
    ),
    AlaanCardData(
      id: 'card5',
      title: 'Office Supplies',
      type: 'Virtual',
      cardNumberSuffix: '5678',
      cardIconAssetPath: 'assets/images/smallCard0.png',
    ),
  ];

  void _handleCardSelection(String cardId) {
    setState(() {
      _selectedCardId = cardId;
    });
  }

  void _onAddToGPayPressed() {
    if (_selectedCardId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a card first.')),
      );
      return;
    }

    final selectedCard =
        _cards.firstWhere((card) => card.id == _selectedCardId);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return GooglePayAlreadyAddedSheet(
          cardTitle: selectedCard.title,
          lastFourDigits: selectedCard.cardNumberSuffix,
        );
      },
    );
  }

  void _onMaybeLaterPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff564194),
                Colors.black,
              ],
            ),
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFAFAFAF),
          ),
          tooltip: 'Back',
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add to Google Pay',
          style: TextStyle(
            color: Color(0xffFCFCFC),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const GPayScreenHeader(),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 16),
                      itemCount: _cards.length,
                      itemBuilder: (context, index) {
                        final card = _cards[index];
                        return CardListItem(
                          cardData: card,
                          isSelected: _selectedCardId == card.id,
                          onTap: () => _handleCardSelection(card.id),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          GPayScreenActions(
            onAddToGPay: _onAddToGPayPressed,
            onMaybeLater: _onMaybeLaterPressed,
          ),
        ],
      ),
    );
  }
}