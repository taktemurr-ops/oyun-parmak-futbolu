import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_parmak_futbolu/oyun_parmak_futbolu.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(futbolConfig.title.length, 33);
    expect(futbolConfig.tagline.length, 33);
    for (final s in futbolConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(futbolRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: futbolId, optionalMechanics: futbolRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(futbolRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
