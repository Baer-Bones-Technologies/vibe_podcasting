import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class Subscription{
  final String userId;
  final String podcastId;

  const Subscription({
    required this.userId,
    required this.podcastId,
});

    factory Subscription.fromJson(
      Map<String, dynamic> json,
    ) => _$SubscriptionFromJson(
          json,
        );

    Map<String, dynamic> toJson() => _$SubscriptionToJson(
          this,
        );
}