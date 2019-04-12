;;; Compiled snippets and support files for `rjsx-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'rjsx-mode
                     '(("yuidoc-rrender" "/**\n * ${1:Render the component}\n *\n * @method render\n */" "YuiDocs React Render" nil
                        ("docs")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/yuidoc-render" nil nil)
                       ("yuidoc-ptype" "/**\n* $0\n*\n* @property $2\n* @type $3\n* @required\n*/" "YuiDocs React Proptype" nil
                        ("docs")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/yuidoc-prop" nil nil)
                       ("yuidoc" "/**\n * $0\n *\n * ${1:$$(yas-auto-next (yas-choose-value '(\"@method\" \"@class\" \"@element\" \"@module\")))} $2\n */" "YuiDocs" nil
                        ("docs")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/yuidoc" nil nil)
                       ("slc-file" "import React from \"react\"\n\nconst $1 = () => (\n      <div>\n      $0\n      </div>\n)\n\nexport default $1" "Stateless Component File" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/slc-file" nil nil)
                       ("slc" "const $1 = () => (\n      <div>\n      $0\n      </div>\n)" "Stateless Component" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/slc" nil nil)
                       ("rdx-container" "import React, { Component } from \"react\"\nimport { connect } from \"react-redux\"\n\nclass $1 extends Component {\n      render(){\n        return ($2)\n      }\n}\n\nconst mapStateToProps = store => ({})\n\nconst mapDispatchToProps = dispatch => ({})\n\nexport default connect(\n  mapStateToProps,\n  mapDispatchToProps\n)($1)\n" "React-redux Container" nil
                        ("react" "redux")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/react-redux-container" nil nil)
                       ("rn-container" "import React, { Component } from \"react\"\nimport { connect } from \"react-redux\"\nimport {\n  StyleSheet,\n  Text,\n  View\n} from \"react-native\"\nimport PropTypes from \"prop-types\"\n\n\n/**\n * ${2:...}\n *\n * @class $1\n */\nclass $1 extends Component {\n      render(){\n        return <View>\n                <Text>${3:...}</Text>\n               </View>\n      }\n}\n\n$1.propTypes = {};\n\nconst styles = StyleSheet.create({})\n\nconst mapStateToProps = store => ({})\n\nconst mapDispatchToProps = dispatch => ({})\n\nexport default connect(\n  mapStateToProps,\n  mapDispatchToProps\n)($1)\n" "React Native Container" nil
                        ("docs")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/react-native-container" nil nil)
                       ("rn-component" "import React from \"react\"\nimport {\n  StyleSheet,\n  Text,\n  View\n} from \"react-native\"\n\n\nconst $1 = () => (\n      <View>\n        <Text>$2</Text>\n      </View>\n)\n\nconst styles = StyleSheet.create({})\n\nexport default $1" "React Native Component" nil
                        ("react-native")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/react-native-component" nil nil)
                       ("i-ptypes" "import PropTypes from \"prop-types\";\n" "Import PropTypes" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/proptypes" nil nil)
                       ("ptype" "/**\n* $0\n*\n* @property $1\n* @type $2\n* @required\n*/\n$1: PropTypes.${2:$$(yas-auto-next (yas-choose-value '(\"string\" \"func\" \"bool\" \"object\" \"any\")))}${3:.isRequired}\n" "PropType declaration" nil
                        ("docs")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/proptype" nil nil)
                       ("im" "import $1 from \"${2:./}$1\"$0" "Import component" nil nil nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/import" nil nil)
                       ("udesc" "describe(\"$1\", () => {\n  it(\"$2\", () => {\n  $0\n  })\n})" "Unit test describe" nil
                        ("unit-test")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/describe" nil nil)
                       ("const" "constructor(props) {\nsuper(props)\nthis.state = {}\n$0\n}" "Class component constructor" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/constructor" nil nil)
                       ("did-update" "componentDidUpdate(prevProps, prevState, snapshot) {\n                              $0\n}" "Component Did Update" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/componentDidUpdate" nil nil)
                       ("life" "componentDidMount() {}\n\ncomponentDidUpdate(prevProps, prevState, snapshot) {}\n\ncomponentWillUnmount() {}" "Component Lifecycle" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/component-lifecycle" nil nil)
                       ("mth" "/**\n * ${2:...}\n *\n * @method $1\n */\n\n$1() {\n     $0\n     }" "class-method" nil
                        ("docs")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/class-method" nil nil)
                       ("class-component" "class $1 extends Component {\n      render(){\n        return ($2)\n      }\n}" "Class Component" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/class-component" nil nil)
                       ("bmth" "this.$1 = this.$1.bind(this)" "Bind Method" nil
                        ("react")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/bind-method" nil nil)
                       ("act-sync-doc" "/**\n * $0\n *\n * @method $1\n */\nexport const $1 = ${2:$$(yas-auto-next (yas-choose-value '(\"payload\" \"()\")))} => ({\n       type: ${3:$$(upcase (camelCase->snake-case (or (yas-field-value 1) \"\") \"_\"))},\n       ${2:$(when (equal (yas-field-value 2) \"payload\") \"payload\")}\n})" "Sync action creator with yuidoc" nil
                        ("docs")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/act-sync-doc" nil nil)
                       ("act-sync" "export const $1 = ${2:$$(yas-auto-next (yas-choose-value '(\"payload\" \"()\")))} => ({\n       type: ${3:$$(upcase (camelCase->snake-case (or (yas-field-value 1) \"\") \"_\"))},\n       ${2:$(when (equal (yas-field-value 2) \"payload\") \"payload\")}\n})" "Sync action creator" nil
                        ("react" "redux")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/act-sync" nil nil)
                       ("act-obj" "export const $1 = \"$1\"" "Action object" nil
                        ("react" "redux")
                        nil "/Users/rserra/.emacs.d/snippets/rjsx-mode/act-obj" nil nil)))


;;; Do not edit! File generated at Thu Apr 11 13:10:10 2019
