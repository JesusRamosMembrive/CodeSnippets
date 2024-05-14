#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _0x5f_CodeSnippetApp_Main_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_MyGroupbox_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_CodeDisplayPage_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_Components_CustomTextArea_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_Modules_ListsOfModels_DataTypesModel_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_Modules_ListsOfModels_ControlFlowModels_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_Modules_ListsOfModels_MapOfAssociations_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_Modules_Utils_FileReader_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_ScrollViewTopics_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _0x5f_CodeSnippetApp_CustonButtomMenu_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/Main.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_Main_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/MyGroupbox.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_MyGroupbox_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/CodeDisplayPage.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_CodeDisplayPage_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/Components/CustomTextArea.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_Components_CustomTextArea_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/Modules/ListsOfModels/DataTypesModel.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_Modules_ListsOfModels_DataTypesModel_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/Modules/ListsOfModels/ControlFlowModels.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_Modules_ListsOfModels_ControlFlowModels_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/Modules/ListsOfModels/MapOfAssociations.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_Modules_ListsOfModels_MapOfAssociations_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/Modules/Utils/FileReader.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_Modules_Utils_FileReader_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/ScrollViewTopics.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_ScrollViewTopics_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/CodeSnippetApp/CustonButtomMenu.qml"), &QmlCacheGeneratedCode::_0x5f_CodeSnippetApp_CustonButtomMenu_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appCodeSnippetApp)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_appCodeSnippetApp))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_appCodeSnippetApp)() {
    return 1;
}
