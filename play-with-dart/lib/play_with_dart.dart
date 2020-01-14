var testInput = '''
      .sup {}
      .dude {}
    ''';
var removeDot = (String rule) => rule.substring(1);
var extractMatch = (RegExpMatch match) => match.group(0);
var typeDefOfRule = (String ruleName) => 'export const ${ruleName}: string;';
var createTypeDefFile = (content, typeDef) => '${content}\n${typeDef}';
