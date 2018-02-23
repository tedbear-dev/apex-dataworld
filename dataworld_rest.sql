set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_default_workspace_id=>2862285334126361
);
end;
/
begin
wwv_flow_api.remove_restful_service(
 p_id=>wwv_flow_api.id(2972494811214999)
,p_name=>'com.oracle.skunkworks.dataworld'
);
 
end;
/
prompt --application/restful_services/com_oracle_skunkworks_dataworld
begin
wwv_flow_api.create_restful_module(
 p_id=>wwv_flow_api.id(2972494811214999)
,p_name=>'com.oracle.skunkworks.dataworld'
,p_uri_prefix=>'rest/'
,p_parsing_schema=>'DW'
,p_items_per_page=>25
,p_status=>'PUBLISHED'
,p_row_version_number=>17
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(3897470657052659)
,p_module_id=>wwv_flow_api.id(2972494811214999)
,p_uri_template=>'asset/{id}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(3897554703057023)
,p_template_id=>wwv_flow_api.id(3897470657052659)
,p_source_type=>'MEDIA'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select mime_type,blob_content',
'from dw_assets',
'where id = :id'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(3934538694506540)
,p_module_id=>wwv_flow_api.id(2972494811214999)
,p_uri_template=>'function/{uuid}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(3934697264510095)
,p_template_id=>wwv_flow_api.id(3934538694506540)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  dw_sql.execute_function(:uuid,null);',
'end;'))
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(3960683405754734)
,p_template_id=>wwv_flow_api.id(3934538694506540)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'POST'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  dw_sql.execute_function(:uuid,:body);',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(2972504295215001)
,p_module_id=>wwv_flow_api.id(2972494811214999)
,p_uri_template=>'scene/{uuid}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(2972691133215002)
,p_template_id=>wwv_flow_api.id(2972504295215001)
,p_source_type=>'PLSQL'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  dw_scene.render(:uuid);',
'end;'))
);
wwv_flow_api.create_restful_template(
 p_id=>wwv_flow_api.id(3062057055482543)
,p_module_id=>wwv_flow_api.id(2972494811214999)
,p_uri_template=>'static/{file_name}'
,p_priority=>0
,p_etag_type=>'HASH'
);
wwv_flow_api.create_restful_handler(
 p_id=>wwv_flow_api.id(3062104513486352)
,p_template_id=>wwv_flow_api.id(3062057055482543)
,p_source_type=>'MEDIA'
,p_format=>'DEFAULT'
,p_method=>'GET'
,p_require_https=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select mime_type,file_content',
'from dw_static_files',
'where file_name = :file_name'))
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
