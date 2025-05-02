SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.addresses (
    id bigint NOT NULL,
    lat double precision,
    lon double precision,
    full_address character varying NOT NULL,
    phone_number character varying NOT NULL,
    full_name character varying,
    address_type integer DEFAULT 0 NOT NULL,
    used_as integer DEFAULT 0 NOT NULL,
    city_id bigint,
    country_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role integer,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    name character varying,
    department character varying,
    warehouse_id bigint
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_settings (
    id integer NOT NULL,
    name character varying,
    value character varying,
    build character varying,
    app_version character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: app_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.app_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.app_settings_id_seq OWNED BY public.app_settings.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attachments (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: bank_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bank_accounts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    branch_name character varying,
    account_number character varying NOT NULL,
    iban character varying NOT NULL,
    swift_code character varying,
    status integer DEFAULT 0 NOT NULL,
    country_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    city_id bigint NOT NULL
);


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.bank_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;


--
-- Name: billings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.billings (
    id bigint NOT NULL,
    invoice_id character varying,
    issue_date timestamp without time zone,
    due_date timestamp without time zone,
    fully_paid_date timestamp without time zone,
    merchant_id bigint,
    total_cost double precision DEFAULT 0.0,
    total_delivery_fee double precision DEFAULT 0.0,
    total_cod double precision DEFAULT 0.0,
    is_paid boolean DEFAULT false,
    notes text DEFAULT 'No notes'::text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    orders_count integer DEFAULT 0,
    start_period timestamp without time zone,
    end_period timestamp without time zone,
    cash_collected double precision DEFAULT 0.0,
    credit_collected double precision DEFAULT 0.0,
    week integer DEFAULT 0,
    email_status integer,
    billing_cycle integer DEFAULT 0 NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    total_return_fee numeric,
    total_additional_products_fee numeric(12,2) DEFAULT 0.0 NOT NULL,
    discount_value numeric(10,2) DEFAULT 0.0,
    discount_mode integer DEFAULT 0,
    discount_computed_amount numeric(10,2) DEFAULT 0.0,
    status integer DEFAULT 0 NOT NULL,
    total_reverse_fee numeric(10,2) DEFAULT 0,
    storage_fees numeric(10,2) DEFAULT 0 NOT NULL,
    fulfillment_fees numeric(10,2) DEFAULT 0 NOT NULL,
    document_state integer DEFAULT 0 NOT NULL,
    payment_state integer DEFAULT 0 NOT NULL,
    zatca_state integer DEFAULT 0 NOT NULL,
    zoho_invoice_id bigint,
    lock_period_days integer DEFAULT 45,
    late_period_days integer DEFAULT 42,
    lock_state integer DEFAULT 0,
    lock_last_checked_at timestamp without time zone
);


--
-- Name: billings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.billings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: billings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.billings_id_seq OWNED BY public.billings.id;


--
-- Name: boxes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.boxes (
    id bigint NOT NULL,
    order_id bigint,
    tracking_no character varying,
    status integer,
    products jsonb
);


--
-- Name: boxes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.boxes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: boxes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.boxes_id_seq OWNED BY public.boxes.id;


--
-- Name: callback_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.callback_logs (
    id bigint NOT NULL,
    order_id bigint,
    response text,
    response_code smallint,
    headers jsonb,
    payload jsonb,
    url character varying,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: callback_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.callback_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: callback_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.callback_logs_id_seq OWNED BY public.callback_logs.id;


--
-- Name: cashout_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cashout_logs (
    id bigint NOT NULL,
    cashout_id bigint NOT NULL,
    action integer NOT NULL,
    result integer NOT NULL,
    amount numeric(8,2) NOT NULL,
    response jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cashout_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cashout_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cashout_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cashout_logs_id_seq OWNED BY public.cashout_logs.id;


--
-- Name: cashouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cashouts (
    id bigint NOT NULL,
    is_completed boolean DEFAULT false NOT NULL,
    balance double precision,
    wallet_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    courier_id bigint,
    tranzaction_id bigint,
    payment_status integer DEFAULT 0,
    state integer
);


--
-- Name: cashouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cashouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cashouts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cashouts_id_seq OWNED BY public.cashouts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name_ar character varying,
    is_active boolean
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: categories_merchants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories_merchants (
    merchant_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_messages (
    id bigint NOT NULL,
    "from" character varying,
    "to" character varying,
    message text,
    twilio_sid character varying,
    message_status integer,
    chat_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    message_type integer DEFAULT 0 NOT NULL,
    extra_details jsonb DEFAULT '{}'::jsonb
);


--
-- Name: chat_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chat_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chat_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chat_messages_id_seq OWNED BY public.chat_messages.id;


--
-- Name: chats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chats (
    id bigint NOT NULL,
    chat_type integer,
    chat_status integer,
    order_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.chats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- Name: cities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cities (
    id integer NOT NULL,
    name character varying,
    is_active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    country_id integer,
    code integer,
    latitude double precision,
    longitude double precision
);


--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: city_mappings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.city_mappings (
    id bigint NOT NULL,
    barq_name character varying,
    jones_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: city_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.city_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: city_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.city_mappings_id_seq OWNED BY public.city_mappings.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    title character varying(50) DEFAULT ''::character varying,
    comment text,
    commentable_type character varying,
    commentable_id integer,
    user_id integer,
    role character varying DEFAULT 'comments'::character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_type character varying NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying,
    is_active boolean,
    currency character varying,
    country_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    iso_code character varying
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: coupon_merchant_finances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupon_merchant_finances (
    id bigint NOT NULL,
    coupon_id bigint,
    merchant_finance_id bigint,
    redeem_limit integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coupon_merchant_finances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coupon_merchant_finances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupon_merchant_finances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coupon_merchant_finances_id_seq OWNED BY public.coupon_merchant_finances.id;


--
-- Name: coupon_merchants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupon_merchants (
    id bigint NOT NULL,
    coupon_id bigint,
    merchant_id bigint,
    redeem_times integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coupon_merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coupon_merchants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupon_merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coupon_merchants_id_seq OWNED BY public.coupon_merchants.id;


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coupons (
    id integer NOT NULL,
    name character varying,
    value character varying,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    start_time time without time zone,
    end_time time without time zone,
    is_active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coupons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coupons_id_seq OWNED BY public.coupons.id;


--
-- Name: courier_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courier_actions (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    merchant_id bigint,
    courier_id bigint NOT NULL,
    action_type integer DEFAULT 0 NOT NULL,
    action_time timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    latitude double precision DEFAULT 0.0,
    longitude double precision DEFAULT 0.0
);


--
-- Name: courier_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courier_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courier_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courier_actions_id_seq OWNED BY public.courier_actions.id;


--
-- Name: courier_bonuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courier_bonuses (
    id bigint NOT NULL,
    bonus_type integer NOT NULL,
    amount numeric NOT NULL,
    for_date date NOT NULL,
    applied_by character varying NOT NULL,
    note character varying,
    courier_id bigint NOT NULL,
    transaction_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courier_bonuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courier_bonuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courier_bonuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courier_bonuses_id_seq OWNED BY public.courier_bonuses.id;


--
-- Name: courier_enrolls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courier_enrolls (
    id bigint NOT NULL,
    mobile_number character varying,
    is_enrolled boolean,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    full_name character varying,
    email_address character varying,
    city_id bigint NOT NULL,
    device_type character varying,
    device_os character varying,
    device_os_version character varying,
    device_brand character varying,
    vehicle_type integer DEFAULT 0,
    date_of_birth timestamp without time zone,
    accepted_policies integer DEFAULT 0 NOT NULL,
    credentials_token character varying
);


--
-- Name: courier_enrolls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courier_enrolls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courier_enrolls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courier_enrolls_id_seq OWNED BY public.courier_enrolls.id;


--
-- Name: courier_external_ids; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courier_external_ids (
    id bigint NOT NULL,
    courier_id bigint NOT NULL,
    name integer,
    value character varying,
    status integer DEFAULT 0 NOT NULL,
    started_at timestamp without time zone,
    finished_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courier_external_ids_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courier_external_ids_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courier_external_ids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courier_external_ids_id_seq OWNED BY public.courier_external_ids.id;


--
-- Name: courier_payment_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courier_payment_logs (
    id bigint NOT NULL,
    courier_payment_id bigint NOT NULL,
    action integer NOT NULL,
    result integer NOT NULL,
    amount numeric(8,2) NOT NULL,
    response jsonb,
    reference_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courier_payment_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courier_payment_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courier_payment_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courier_payment_logs_id_seq OWNED BY public.courier_payment_logs.id;


--
-- Name: courier_payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courier_payments (
    id bigint NOT NULL,
    courier_id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    payment_type integer NOT NULL,
    payment_status integer DEFAULT 0 NOT NULL,
    reference_number character varying NOT NULL,
    amount numeric(8,2) NOT NULL,
    branch_id character varying,
    teller_id character varying,
    device_id character varying,
    stcpay_mobile character varying,
    stcpay_ref character varying,
    stcpay_otp_ref character varying,
    stcpay_otp character varying,
    reflected_in_wallet boolean,
    short_description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    otp_expire_at timestamp without time zone
);


--
-- Name: courier_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courier_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courier_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courier_payments_id_seq OWNED BY public.courier_payments.id;


--
-- Name: couriers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.couriers (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    id_number character varying,
    avatar_url character varying,
    passport_no character varying,
    passport_country character varying,
    address_verification_url character varying,
    bank_iban_no character varying,
    bank_swift character varying,
    bank_country character varying,
    stc_pay_qr_url character varying,
    mobile_number character varying,
    email character varying,
    password_digest character varying,
    emergency_contact character varying,
    emergency_number character varying,
    nationality character varying,
    language character varying,
    date_of_birth date,
    city_id integer,
    is_online boolean DEFAULT false,
    is_busy boolean DEFAULT false,
    is_banned boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    device_token text,
    socket_id text,
    latitude double precision,
    longitude double precision,
    last_dispatched_at timestamp without time zone,
    partner_id bigint,
    hub_id bigint,
    min_orders integer DEFAULT 50,
    courier_type integer DEFAULT 0,
    vehicle_type integer DEFAULT 0,
    dedicated_to integer DEFAULT 0 NOT NULL,
    merchant_id integer,
    open_radius boolean DEFAULT false NOT NULL,
    working_radius integer DEFAULT 8 NOT NULL,
    device_type character varying,
    last_seen timestamp without time zone,
    app_version character varying,
    official_info jsonb DEFAULT '{}'::jsonb,
    id_number_status integer DEFAULT 0 NOT NULL,
    id_expiry_date timestamp without time zone,
    order_payment_type integer DEFAULT 0 NOT NULL,
    dress integer,
    os_version character varying,
    max_debit_allowed integer DEFAULT 500,
    trust_level integer DEFAULT 0,
    ban_end_at timestamp without time zone,
    ban_reason character varying,
    banned_by_id integer,
    banned_by_type character varying,
    flags integer DEFAULT 0 NOT NULL,
    external_ref_id integer,
    external_ref_type character varying,
    citc_info jsonb DEFAULT '{}'::jsonb,
    geidea_tsrm_id character varying,
    order_type integer DEFAULT 0 NOT NULL,
    imei character varying,
    joined_at timestamp without time zone,
    enable_new_wallet boolean DEFAULT false
);


--
-- Name: couriers_hubs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.couriers_hubs (
    courier_id bigint NOT NULL,
    hub_id bigint NOT NULL
);


--
-- Name: couriers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.couriers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: couriers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.couriers_id_seq OWNED BY public.couriers.id;


--
-- Name: couriers_merchants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.couriers_merchants (
    courier_id bigint NOT NULL,
    merchant_id bigint NOT NULL
);


--
-- Name: couriers_neighborhoods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.couriers_neighborhoods (
    courier_id bigint NOT NULL,
    neighborhood_id bigint NOT NULL
);


--
-- Name: credit_cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.credit_cards (
    id bigint NOT NULL,
    number character varying NOT NULL,
    expiry date NOT NULL,
    card_type integer DEFAULT 0 NOT NULL,
    name character varying,
    external_reference_id character varying,
    external_reference_service character varying,
    owner_type character varying,
    owner_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: credit_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.credit_cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: credit_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.credit_cards_id_seq OWNED BY public.credit_cards.id;


--
-- Name: csv_exports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.csv_exports (
    id bigint NOT NULL,
    name character varying NOT NULL,
    admin_id bigint,
    csv_model_name character varying NOT NULL,
    error_message character varying,
    status integer DEFAULT 0 NOT NULL,
    params jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: csv_exports_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.csv_exports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: csv_exports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.csv_exports_id_seq OWNED BY public.csv_exports.id;


--
-- Name: delivery_attempts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery_attempts (
    id bigint NOT NULL,
    order_id bigint,
    courier_id bigint,
    failure_reason_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: delivery_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delivery_attempts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delivery_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delivery_attempts_id_seq OWNED BY public.delivery_attempts.id;


--
-- Name: delivery_partners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery_partners (
    id bigint NOT NULL,
    key character varying,
    name character varying
);


--
-- Name: delivery_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delivery_partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delivery_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delivery_partners_id_seq OWNED BY public.delivery_partners.id;


--
-- Name: delivery_reward_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery_reward_categories (
    id bigint NOT NULL,
    min_distance double precision DEFAULT 0.0 NOT NULL,
    max_distance double precision NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    reward_amount double precision NOT NULL,
    initial_fee_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: delivery_reward_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delivery_reward_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delivery_reward_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delivery_reward_categories_id_seq OWNED BY public.delivery_reward_categories.id;


--
-- Name: delivery_rewards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.delivery_rewards (
    id bigint NOT NULL,
    basic_fee double precision DEFAULT 0.0,
    route_fee double precision DEFAULT 0.0,
    return_reward double precision DEFAULT 0.0,
    reward_bonus double precision DEFAULT 0.0,
    delivery_distance double precision DEFAULT 0.0,
    company_income double precision DEFAULT 0.0,
    knight_income double precision DEFAULT 0.0,
    payment_status integer DEFAULT 0,
    order_id integer,
    shipment_id integer,
    courier_id integer,
    accept_time timestamp without time zone,
    complete_time timestamp without time zone,
    complete_duration integer,
    courier_rating double precision,
    wallet_balance_prev double precision DEFAULT 0.0,
    wallet_balance_after double precision DEFAULT 0.0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    company_percentage double precision DEFAULT 0.0,
    gmv_revenue double precision DEFAULT 0.0,
    gmv_percentage double precision DEFAULT 0.0,
    transaction_details jsonb DEFAULT '{}'::jsonb
);


--
-- Name: delivery_rewards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.delivery_rewards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delivery_rewards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.delivery_rewards_id_seq OWNED BY public.delivery_rewards.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    type integer,
    number character varying,
    expiry_date date,
    issue_country character varying,
    documentable_id integer,
    documentable_type integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: exception_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exception_orders (
    id bigint NOT NULL,
    params jsonb DEFAULT '"{}"'::jsonb NOT NULL,
    request_url character varying,
    request_made_by_type character varying,
    request_made_by_id integer,
    error_message character varying,
    status integer DEFAULT 0 NOT NULL,
    grand_total double precision NOT NULL,
    delivery_fee double precision NOT NULL,
    payment_type character varying NOT NULL,
    shipment_type character varying NOT NULL,
    merchant_order_id character varying NOT NULL,
    merchant_tracking_no character varying,
    tracking_no character varying NOT NULL,
    order_status character varying NOT NULL,
    pickup_otp character varying,
    delivery_otp character varying NOT NULL,
    products jsonb DEFAULT '"\"{}\""'::jsonb NOT NULL,
    customer_details jsonb DEFAULT '"\"{}\""'::jsonb NOT NULL,
    origin jsonb DEFAULT '"\"{}\""'::jsonb NOT NULL,
    destination jsonb DEFAULT '"\"{}\""'::jsonb NOT NULL,
    is_active boolean DEFAULT false,
    is_assigned boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    merchant_id integer,
    shipment_id integer,
    is_completed boolean DEFAULT false,
    delivery_start timestamp without time zone,
    delivery_finish timestamp without time zone,
    hub_id bigint,
    neighborhood_id bigint,
    address_status integer DEFAULT 0,
    cod_fee double precision,
    delivery_income double precision DEFAULT 0.0,
    billing_id bigint,
    delivery_reward double precision DEFAULT 0.0,
    return_otp character varying,
    pickup_address_id bigint,
    dropoff_address_id bigint,
    order_type integer DEFAULT 0 NOT NULL,
    store_id bigint,
    user_id bigint,
    invoice_total double precision DEFAULT 0.0,
    payment_status integer DEFAULT 0,
    return_fee double precision DEFAULT 0.0,
    is_returned boolean DEFAULT false,
    order_status_reason_id bigint,
    hub_user_id bigint,
    checkout_token character varying,
    checkout_token_expires_at timestamp without time zone,
    collected_by integer DEFAULT 0 NOT NULL,
    additional_notes text,
    alternate_contact jsonb DEFAULT '"{}"'::jsonb,
    status_times jsonb DEFAULT '"{}"'::jsonb,
    driving_distance double precision,
    driving_duration double precision,
    notified_by integer DEFAULT 0,
    notified_time timestamp without time zone,
    whatsapp_address integer DEFAULT 0,
    packages_count integer DEFAULT 1
);


--
-- Name: exception_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exception_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exception_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exception_orders_id_seq OWNED BY public.exception_orders.id;


--
-- Name: exported_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.exported_files (
    id bigint NOT NULL,
    merchant_id bigint NOT NULL,
    file_type character varying NOT NULL,
    file_name character varying NOT NULL,
    file character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: exported_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.exported_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exported_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.exported_files_id_seq OWNED BY public.exported_files.id;


--
-- Name: external_mappers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.external_mappers (
    id bigint NOT NULL,
    barq_key character varying,
    service_key character varying,
    type character varying,
    external_service integer DEFAULT 0 NOT NULL,
    extra_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_platform integer,
    mapping_type integer
);


--
-- Name: external_mappers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.external_mappers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_mappers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.external_mappers_id_seq OWNED BY public.external_mappers.id;


--
-- Name: finance_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_accounts (
    id bigint NOT NULL,
    owner_type character varying,
    owner_id bigint,
    name character varying,
    display_name character varying,
    type character varying,
    contra boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tmp_finance_accounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmp_finance_accounts (
    id bigint NOT NULL,
    owner_type character varying,
    owner_id bigint,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: finance_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_accounts_id_seq OWNED BY public.tmp_finance_accounts.id;


--
-- Name: finance_accounts_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_accounts_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_accounts_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_accounts_id_seq1 OWNED BY public.finance_accounts.id;


--
-- Name: finance_amounts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_amounts (
    id bigint NOT NULL,
    finance_entry_id bigint,
    amount numeric(20,10),
    type character varying,
    finance_account_id bigint
);


--
-- Name: finance_amounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_amounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_amounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_amounts_id_seq OWNED BY public.finance_amounts.id;


--
-- Name: finance_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.finance_entries (
    id bigint NOT NULL,
    description character varying,
    date timestamp without time zone,
    event integer,
    reversing_entry_id bigint,
    order_id bigint,
    object_type character varying,
    object_id bigint,
    merchant_id bigint,
    courier_id bigint
);


--
-- Name: tmp_finance_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tmp_finance_entries (
    id bigint NOT NULL,
    from_account_id bigint NOT NULL,
    to_account_id bigint NOT NULL,
    document_type character varying,
    document_id bigint,
    amount numeric,
    date timestamp without time zone,
    notes character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: finance_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_entries_id_seq OWNED BY public.tmp_finance_entries.id;


--
-- Name: finance_entries_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.finance_entries_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: finance_entries_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.finance_entries_id_seq1 OWNED BY public.finance_entries.id;


--
-- Name: foodics_merchants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.foodics_merchants (
    id bigint NOT NULL,
    code character varying,
    state character varying,
    bearer_token character varying,
    access_token character varying,
    merchant_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: foodics_merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.foodics_merchants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: foodics_merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.foodics_merchants_id_seq OWNED BY public.foodics_merchants.id;


--
-- Name: group_shipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.group_shipments (
    id bigint NOT NULL,
    origin_zone character varying,
    destination_zone character varying,
    uid character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    courier_id bigint
);


--
-- Name: group_shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.group_shipments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: group_shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.group_shipments_id_seq OWNED BY public.group_shipments.id;


--
-- Name: hub_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hub_users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    mobile_number character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    merchant_id bigint,
    hub_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    orders_file character varying,
    device_token character varying,
    flags integer DEFAULT 0 NOT NULL,
    reverse_orders_file character varying
);


--
-- Name: hub_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hub_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hub_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hub_users_id_seq OWNED BY public.hub_users.id;


--
-- Name: hubs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hubs (
    id integer NOT NULL,
    code character varying,
    manager character varying,
    mobile character varying,
    phone character varying,
    latitude double precision,
    longitude double precision,
    is_active boolean,
    city_id integer,
    merchant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    opening_time time without time zone DEFAULT '04:00:00'::time without time zone,
    closing_time time without time zone DEFAULT '11:00:00'::time without time zone,
    start_day integer DEFAULT 0,
    end_day integer DEFAULT 5,
    store_id bigint,
    bundle_limit integer DEFAULT 4,
    dispatch_time_gap integer DEFAULT 0,
    last_dispatch_at timestamp without time zone,
    hub_type integer DEFAULT 0,
    street_name character varying,
    dispatch_radius integer DEFAULT 8,
    max_distance double precision DEFAULT 50.0,
    is_open boolean DEFAULT false NOT NULL,
    neighborhood_id bigint,
    max_multiplier_distance integer DEFAULT 0 NOT NULL,
    is_sms boolean DEFAULT false NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    promise_time_advantage integer,
    external_reference_id character varying,
    timings jsonb DEFAULT '{}'::jsonb,
    reference_id character varying,
    cutoff_time time without time zone DEFAULT '09:00:00'::time without time zone,
    trusted_address integer DEFAULT 0,
    torod_id integer
);


--
-- Name: hubs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hubs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hubs_id_seq OWNED BY public.hubs.id;


--
-- Name: hubs_neighborhoods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.hubs_neighborhoods (
    id bigint NOT NULL,
    hub_id bigint,
    neighborhood_id bigint
);


--
-- Name: hubs_neighborhoods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hubs_neighborhoods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hubs_neighborhoods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.hubs_neighborhoods_id_seq OWNED BY public.hubs_neighborhoods.id;


--
-- Name: merchant_city_partners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchant_city_partners (
    id bigint NOT NULL,
    city_id bigint,
    partner_id bigint,
    merchant_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: merchant_city_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merchant_city_partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merchant_city_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merchant_city_partners_id_seq OWNED BY public.merchant_city_partners.id;


--
-- Name: merchant_finances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchant_finances (
    id bigint NOT NULL,
    name character varying NOT NULL,
    code character varying,
    pricing_model integer DEFAULT 0 NOT NULL,
    billing_type integer DEFAULT 0 NOT NULL,
    distance_multiplier double precision DEFAULT 0.0,
    distance_multiplier_starts_at double precision DEFAULT 0.0,
    delivery_fee_limit double precision DEFAULT 0.0,
    barq_percentage double precision NOT NULL,
    max_insurance double precision,
    return_fee double precision,
    invoice_fee double precision,
    cod_handling_fee double precision,
    flags integer DEFAULT 0 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    b2b_order_fee double precision DEFAULT 0.0 NOT NULL,
    cod_mode integer DEFAULT 0 NOT NULL,
    weight_threshold integer DEFAULT 0,
    per_weight_price numeric(10,2) DEFAULT 0.0 NOT NULL,
    weight_increment integer DEFAULT 0,
    reverse_mode integer DEFAULT 0,
    reverse_value numeric(10,2) DEFAULT 0,
    storage_fee numeric(10,2) DEFAULT 0,
    fulfillment_fee numeric(10,2) DEFAULT 0,
    order_item_count_pricing jsonb DEFAULT '[]'::jsonb,
    delivery_fee_pricing jsonb DEFAULT '[]'::jsonb
);


--
-- Name: merchant_finances_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merchant_finances_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merchant_finances_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merchant_finances_id_seq OWNED BY public.merchant_finances.id;


--
-- Name: merchant_suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchant_suppliers (
    id bigint NOT NULL,
    merchant_id bigint,
    supplier_id bigint,
    city_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: merchant_suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merchant_suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merchant_suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merchant_suppliers_id_seq OWNED BY public.merchant_suppliers.id;


--
-- Name: merchants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchants (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    name character varying,
    code character varying,
    manager_name character varying,
    mobile character varying,
    is_active boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    country_id bigint,
    delivery_fee character varying,
    slack_url character varying,
    slack_channel character varying,
    toc_acceptance boolean DEFAULT true,
    privacy_policy_acceptance boolean DEFAULT true,
    cod_fee double precision DEFAULT 0.0,
    have_cod boolean DEFAULT true,
    iban_no character varying DEFAULT ''::character varying,
    return_fee double precision DEFAULT 8.0,
    percentage double precision DEFAULT 0.0,
    insurance_fee double precision DEFAULT 200.0,
    cashout_per_week integer DEFAULT 1,
    invoicing_fee double precision DEFAULT 8.0,
    website_url character varying,
    callback_url character varying,
    is_sms boolean DEFAULT true,
    name_ar character varying,
    distance_multiplier boolean DEFAULT false,
    multiplier_value double precision DEFAULT 1.75,
    max_cost_limit double precision DEFAULT 0.0 NOT NULL,
    barq_invoicing_enabled boolean DEFAULT false NOT NULL,
    orders_file character varying,
    merchant_type integer DEFAULT 0,
    max_allowed_distance integer DEFAULT 0 NOT NULL,
    max_multiplier_distance integer DEFAULT 0 NOT NULL,
    is_full_reward boolean DEFAULT false NOT NULL,
    full_reward_threshold integer DEFAULT 0 NOT NULL,
    referred_by character varying,
    allow_cancellation integer DEFAULT 0,
    min_balance_allowed double precision DEFAULT 0.0 NOT NULL,
    max_orders_over_limit integer DEFAULT 0 NOT NULL,
    payment_type integer DEFAULT 0 NOT NULL,
    delivery_proof integer DEFAULT 0,
    food_accept_in_km double precision DEFAULT 5.0,
    food_complete_in_km double precision DEFAULT 0.5,
    merchant_products integer DEFAULT 0,
    allowed_pickup_distance double precision DEFAULT 0.5,
    promise_time_advantage integer,
    billing_cycle integer DEFAULT 0 NOT NULL,
    payment_preference integer DEFAULT 0 NOT NULL,
    awb_always integer DEFAULT 0,
    bank_name character varying,
    bank_city_id integer,
    stc_mobile character varying,
    awb_description integer DEFAULT 0,
    merchant_finance_id bigint,
    platform integer DEFAULT 0,
    device_token character varying,
    shopify_url character varying,
    integrity_key character varying,
    gmv_percentage double precision DEFAULT 0.0,
    gmv_percentage_status integer DEFAULT 0,
    billing_email character varying,
    multi_language_message integer DEFAULT 0,
    trusted_address integer DEFAULT 0,
    bulk_amount double precision DEFAULT 0.0 NOT NULL,
    external_reference_id character varying,
    external_reference_platform integer DEFAULT 0 NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    pick_up_point integer DEFAULT 0,
    inter_city_allowed boolean,
    reverse_orders_file character varying,
    zid_details jsonb DEFAULT '{}'::jsonb,
    orders_status_file character varying,
    vat_number character varying,
    notification_mechanism integer DEFAULT 0 NOT NULL,
    shipment_type integer DEFAULT 0 NOT NULL,
    b2b_order_fee double precision DEFAULT 0.0 NOT NULL,
    auth_token character varying,
    customer_courier_contact_mode integer DEFAULT 0 NOT NULL,
    callback_headers character varying,
    parent_merchant_id bigint,
    tax_id_type integer,
    tax_id_value character varying,
    tax_name character varying,
    manager_merchant_id bigint,
    default_pallets_rented integer DEFAULT 0,
    delivery_attempts_limit integer DEFAULT 0,
    zoho_contact_id bigint,
    tax_name_ar character varying,
    enable_new_wallet boolean DEFAULT false,
    extra_details jsonb DEFAULT '{}'::jsonb
);


--
-- Name: merchants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merchants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merchants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merchants_id_seq OWNED BY public.merchants.id;


--
-- Name: merchants_partners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchants_partners (
    merchant_id bigint NOT NULL,
    partner_id bigint NOT NULL
);


--
-- Name: merchants_shipment_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merchants_shipment_types (
    merchant_id bigint NOT NULL,
    shipment_type_id bigint NOT NULL
);


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    merchant_id bigint,
    text character varying,
    text_ar character varying
);


--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: mobile_devices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mobile_devices (
    id bigint NOT NULL,
    device_unique_id character varying NOT NULL,
    device_type integer NOT NULL,
    operating_system character varying,
    fcm_token text,
    device_manufacturer character varying,
    device_model character varying,
    app_build_number integer,
    version_identifier character varying,
    lat numeric(10,6),
    lon numeric(10,6),
    current_location_accuracy double precision,
    language integer DEFAULT 0 NOT NULL,
    mobile_number character varying,
    verification_code character varying,
    verified_at timestamp without time zone,
    verification_code_sent_at timestamp without time zone,
    status integer DEFAULT 0 NOT NULL,
    last_opened_at timestamp without time zone,
    last_opened_ip inet,
    created_ip inet,
    city_id bigint,
    country_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    verification_attempt_count integer DEFAULT 0
);


--
-- Name: mobile_devices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mobile_devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mobile_devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mobile_devices_id_seq OWNED BY public.mobile_devices.id;


--
-- Name: neighborhoods; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.neighborhoods (
    id bigint NOT NULL,
    name character varying DEFAULT 'Unnamed Neighborhood'::character varying NOT NULL,
    name_arabic character varying DEFAULT 'Unnamed Arabic Neighborhood'::character varying NOT NULL,
    bounds jsonb DEFAULT '"{}"'::jsonb NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    city_id bigint NOT NULL,
    zone_id integer,
    flags integer DEFAULT 0 NOT NULL,
    geom public.geography(MultiPolygon,4326)
);


--
-- Name: neighborhoods_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.neighborhoods_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: neighborhoods_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.neighborhoods_id_seq OWNED BY public.neighborhoods.id;


--
-- Name: neighborhoods_zones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.neighborhoods_zones (
    zone_id bigint NOT NULL,
    neighborhood_id bigint NOT NULL
);


--
-- Name: order_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_logs (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    status character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    order_status_reason_id bigint,
    message character varying,
    log_type integer DEFAULT 0 NOT NULL,
    note character varying
);


--
-- Name: order_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_logs_id_seq OWNED BY public.order_logs.id;


--
-- Name: order_payments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_payments (
    id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    transaction_type integer NOT NULL,
    external_reference_id character varying,
    amount double precision NOT NULL,
    user_id bigint,
    order_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    transaction_id character varying,
    merchant_id bigint,
    invoice_url character varying
);


--
-- Name: order_payments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_payments_id_seq OWNED BY public.order_payments.id;


--
-- Name: order_routes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_routes (
    id bigint NOT NULL,
    predicted_start_coordinate jsonb DEFAULT '"{}"'::jsonb,
    predicted_end_coordinate jsonb DEFAULT '"{}"'::jsonb,
    actual_start_coordinate jsonb DEFAULT '"{}"'::jsonb,
    actual_end_coordinate jsonb DEFAULT '"{}"'::jsonb,
    predicted_distance double precision NOT NULL,
    actual_distance double precision,
    distance_difference double precision,
    predicted_duration double precision NOT NULL,
    actual_duration double precision,
    weight double precision DEFAULT 0.0 NOT NULL,
    predicted_route jsonb DEFAULT '"{}"'::jsonb,
    actual_route jsonb DEFAULT '"{}"'::jsonb,
    predicted_delivery_reward_category_id integer,
    delivery_reward_category_id bigint,
    order_id bigint,
    shipment_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: order_routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_routes_id_seq OWNED BY public.order_routes.id;


--
-- Name: order_status_reasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_status_reasons (
    id bigint NOT NULL,
    explanation character varying NOT NULL,
    status integer NOT NULL,
    to_blame integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    arabic_explanation text,
    key character varying
);


--
-- Name: order_status_reasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.order_status_reasons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: order_status_reasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.order_status_reasons_id_seq OWNED BY public.order_status_reasons.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    grand_total double precision NOT NULL,
    delivery_fee double precision NOT NULL,
    payment_type character varying NOT NULL,
    shipment_type character varying NOT NULL,
    merchant_order_id character varying NOT NULL,
    merchant_tracking_no character varying,
    tracking_no character varying NOT NULL,
    order_status character varying NOT NULL,
    pickup_otp character varying,
    delivery_otp character varying NOT NULL,
    products jsonb DEFAULT '{}'::jsonb NOT NULL,
    customer_details jsonb DEFAULT '{}'::jsonb NOT NULL,
    origin jsonb DEFAULT '{}'::jsonb NOT NULL,
    destination jsonb DEFAULT '{}'::jsonb NOT NULL,
    is_active boolean DEFAULT false,
    is_assigned boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    merchant_id integer,
    shipment_id integer,
    is_completed boolean DEFAULT false,
    delivery_start timestamp without time zone,
    delivery_finish timestamp without time zone,
    hub_id bigint,
    neighborhood_id bigint,
    address_status integer DEFAULT 0,
    cod_fee double precision,
    delivery_income double precision DEFAULT 0.0,
    billing_id bigint,
    delivery_reward double precision DEFAULT 0.0,
    return_otp character varying,
    pickup_address_id bigint,
    dropoff_address_id bigint,
    order_type integer DEFAULT 0 NOT NULL,
    store_id bigint,
    user_id bigint,
    invoice_total double precision DEFAULT 0.0,
    payment_status integer DEFAULT 0,
    return_fee double precision DEFAULT 0.0,
    is_returned boolean DEFAULT false,
    order_status_reason_id bigint,
    hub_user_id bigint,
    checkout_token character varying,
    checkout_token_expires_at timestamp without time zone,
    collected_by integer DEFAULT 0 NOT NULL,
    additional_notes text,
    alternate_contact jsonb DEFAULT '{}'::jsonb,
    status_times jsonb DEFAULT '{}'::jsonb,
    driving_distance double precision,
    driving_duration double precision,
    notified_by integer DEFAULT 0,
    notified_time timestamp without time zone,
    whatsapp_address integer DEFAULT 0,
    packages_count integer DEFAULT 1,
    airwaybill_image text,
    original_order_id integer,
    status_coordinates jsonb DEFAULT '{}'::jsonb,
    extra_details jsonb DEFAULT '{}'::jsonb,
    return_reason character varying,
    flags integer DEFAULT 0 NOT NULL,
    delivered_by integer DEFAULT 0 NOT NULL,
    citc_info jsonb DEFAULT '{}'::jsonb,
    torood_info jsonb DEFAULT '{}'::jsonb,
    first_mile_order boolean,
    store_name character varying,
    note character varying,
    assignment_method integer DEFAULT 0 NOT NULL,
    warehouse_id bigint,
    sorting_bin character varying,
    connected_order_info jsonb DEFAULT '{}'::jsonb,
    connected_order_id bigint,
    connected_to_order_id bigint,
    warehouse_origin_id bigint,
    warehouse_destination_id bigint,
    merchant_finance_id bigint,
    pickup_confirmation_attrs jsonb DEFAULT '{}'::jsonb,
    pickup_status integer DEFAULT 0 NOT NULL,
    additional_products_fee numeric(11,2) DEFAULT 0.0 NOT NULL,
    total_weight integer DEFAULT 0 NOT NULL,
    reverse_fee numeric(10,2) DEFAULT 0,
    total_distance integer,
    storage_duration integer DEFAULT 0,
    notes text,
    fulfillment_fee numeric(10,2) DEFAULT 0 NOT NULL,
    storage_duration_by integer DEFAULT 0,
    promised_time timestamp without time zone,
    courier_pickup_otp character varying,
    inventory_weight integer,
    ready_since timestamp without time zone,
    pickup_at timestamp without time zone,
    deliver_at timestamp without time zone
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: otp_verifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.otp_verifications (
    id integer NOT NULL,
    mobile character varying,
    otp character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: otp_verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.otp_verifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: otp_verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.otp_verifications_id_seq OWNED BY public.otp_verifications.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.partners (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    mobile character varying,
    commission_type integer DEFAULT 0,
    commission_value double precision DEFAULT 0.0,
    file character varying,
    partner_status integer DEFAULT 0,
    handles_courier_payments boolean DEFAULT false NOT NULL,
    partner_type integer DEFAULT 0 NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    url character varying,
    delivery_points_multiplier numeric(5,3) DEFAULT NULL::numeric,
    delivery_points_target integer
);


--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: payment_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_types (
    id bigint NOT NULL,
    name character varying,
    name_ar character varying,
    is_active boolean DEFAULT false,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description_ar text
);


--
-- Name: payment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.payment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.payment_types_id_seq OWNED BY public.payment_types.id;


--
-- Name: points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.points (
    id integer NOT NULL,
    user_id integer,
    value integer,
    category character varying,
    message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: points_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.points_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.points_id_seq OWNED BY public.points.id;


--
-- Name: process_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.process_logs (
    id bigint NOT NULL,
    name character varying,
    order_ids text[] DEFAULT '{}'::text[],
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: process_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.process_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: process_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.process_logs_id_seq OWNED BY public.process_logs.id;


--
-- Name: referrals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.referrals (
    id bigint NOT NULL,
    name character varying,
    name_localized character varying,
    status integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: referrals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.referrals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: referrals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.referrals_id_seq OWNED BY public.referrals.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: scorecards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scorecards (
    id integer NOT NULL,
    user_id integer,
    daily integer,
    weekly integer,
    monthly integer,
    yearly integer,
    lifetime integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: scorecards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.scorecards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scorecards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.scorecards_id_seq OWNED BY public.scorecards.id;


--
-- Name: shipment_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipment_assignments (
    id bigint NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    shipment_id bigint NOT NULL,
    courier_id bigint NOT NULL,
    ends_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    lat double precision,
    lon double precision
);


--
-- Name: shipment_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shipment_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipment_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shipment_assignments_id_seq OWNED BY public.shipment_assignments.id;


--
-- Name: shipment_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipment_types (
    id bigint NOT NULL,
    key character varying NOT NULL,
    name character varying NOT NULL,
    name_ar character varying NOT NULL,
    sla integer NOT NULL,
    cutoff_time time without time zone DEFAULT '23:59:59'::time without time zone,
    buffer integer DEFAULT 0,
    coverage integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: shipment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shipment_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shipment_types_id_seq OWNED BY public.shipment_types.id;


--
-- Name: shipments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shipments (
    id integer NOT NULL,
    courier_id integer,
    pickup_time timestamp without time zone,
    complete_time timestamp without time zone,
    reward double precision,
    tracking_no character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_assigned boolean DEFAULT false,
    is_completed boolean DEFAULT false,
    low_reward double precision,
    assign_time timestamp without time zone,
    delivery_finish timestamp without time zone,
    promise_time integer,
    is_cancelled boolean DEFAULT false,
    latitude double precision,
    longitude double precision,
    on_hold boolean DEFAULT false,
    promise_times jsonb DEFAULT '{}'::jsonb,
    driving_distance double precision,
    driving_duration double precision,
    shipment_status integer DEFAULT 0,
    partner_id bigint,
    order_status_reason_id bigint,
    group_shipment_id bigint,
    status_coordinates jsonb DEFAULT '{}'::jsonb,
    order_ids text[] DEFAULT '{}'::text[],
    delivery_points integer DEFAULT 0 NOT NULL,
    fmd_courier_id integer,
    estimated_fuel_consumption double precision DEFAULT 0.0
);


--
-- Name: shipments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shipments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shipments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shipments_id_seq OWNED BY public.shipments.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint,
    name_ar character varying
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.suppliers (
    id bigint NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;


--
-- Name: system_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.system_settings (
    id bigint NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: system_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.system_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: system_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.system_settings_id_seq OWNED BY public.system_settings.id;


--
-- Name: torod_city_couriers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.torod_city_couriers (
    id bigint NOT NULL,
    city_id bigint,
    torod_courier_id bigint,
    priority integer DEFAULT 99
);


--
-- Name: torod_city_couriers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.torod_city_couriers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: torod_city_couriers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.torod_city_couriers_id_seq OWNED BY public.torod_city_couriers.id;


--
-- Name: torod_couriers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.torod_couriers (
    id bigint NOT NULL,
    torod_id integer,
    title character varying,
    title_arabic character varying,
    method character varying,
    carrier_logo character varying,
    approximate_delivery_time character varying,
    approximate_delivery_time_arabic character varying,
    pickup_status character varying,
    active boolean DEFAULT true
);


--
-- Name: torod_couriers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.torod_couriers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: torod_couriers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.torod_couriers_id_seq OWNED BY public.torod_couriers.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transactions (
    id bigint NOT NULL,
    wallet_id bigint,
    notes text,
    amount double precision,
    tracking_no character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    transaction_type integer DEFAULT 0 NOT NULL,
    credit_card_id bigint,
    external_reference_id character varying,
    external_reference_service character varying,
    prev_balance double precision,
    status integer DEFAULT 0 NOT NULL,
    description text,
    issuer_id bigint,
    issuer_type character varying
);


--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying,
    encrypted_password character varying,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    image_url character varying,
    name character varying,
    mobile_number character varying NOT NULL,
    profile_status integer DEFAULT 0 NOT NULL,
    city_id bigint,
    country_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vat_addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vat_addresses (
    id bigint NOT NULL,
    street_name character varying,
    building_number character varying,
    plot_identification character varying,
    city_subdivision_name character varying,
    city_name character varying,
    postal_zone integer,
    merchant_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vat_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vat_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vat_addresses_id_seq OWNED BY public.vat_addresses.id;


--
-- Name: vehicle_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vehicle_assignments (
    id bigint NOT NULL,
    courier_id bigint,
    vehicle_id bigint,
    "from" timestamp without time zone NOT NULL,
    "to" timestamp without time zone,
    reason character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vehicle_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vehicle_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vehicle_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vehicle_assignments_id_seq OWNED BY public.vehicle_assignments.id;


--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vehicles (
    id integer NOT NULL,
    make character varying,
    model character varying,
    year character varying,
    vehicle_type character varying,
    color character varying,
    vin_no character varying,
    plate_no character varying,
    owner_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    imei character varying,
    garage character varying,
    status character varying,
    supplier character varying,
    supply_date date,
    notes text,
    branded boolean,
    fuel_consumption_rate double precision,
    sim_number character varying
);


--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vehicles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vehicles_id_seq OWNED BY public.vehicles.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.versions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id bigint NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone,
    object_changes text,
    shipment_id integer,
    lat_destination double precision,
    lng_destination double precision,
    lat_origin double precision,
    lng_origin double precision,
    status character varying,
    courier_id integer,
    admin_id integer
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: wallets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wallets (
    id integer NOT NULL,
    owner_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner_type character varying NOT NULL,
    credit_limit integer DEFAULT 500,
    limit_exceeded boolean DEFAULT false,
    limit_exceeded_at timestamp without time zone,
    disable_credit_limit boolean DEFAULT false
);


--
-- Name: wallets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wallets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wallets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wallets_id_seq OWNED BY public.wallets.id;


--
-- Name: webhooks_request_stores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webhooks_request_stores (
    id bigint NOT NULL,
    request_body jsonb NOT NULL,
    response_body jsonb,
    path character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: webhooks_request_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.webhooks_request_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: webhooks_request_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.webhooks_request_stores_id_seq OWNED BY public.webhooks_request_stores.id;


--
-- Name: zatca_invoices; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zatca_invoices (
    id bigint NOT NULL,
    billing_id bigint,
    previous_invoice_id bigint,
    state smallint DEFAULT 0,
    invoice_hash character varying,
    uuid character varying,
    xml character varying,
    signed_xml character varying,
    response character varying,
    submitted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zatca_invoices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zatca_invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zatca_invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zatca_invoices_id_seq OWNED BY public.zatca_invoices.id;


--
-- Name: zid_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zid_logs (
    id bigint NOT NULL,
    order_params jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    callback_type character varying
);


--
-- Name: zid_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zid_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zid_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zid_logs_id_seq OWNED BY public.zid_logs.id;


--
-- Name: zid_webhook_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zid_webhook_logs (
    id bigint NOT NULL,
    merchant_id bigint,
    order_params jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zid_webhook_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zid_webhook_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zid_webhook_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zid_webhook_logs_id_seq OWNED BY public.zid_webhook_logs.id;


--
-- Name: zones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.zones (
    id bigint NOT NULL,
    name character varying NOT NULL,
    prefix character varying NOT NULL,
    city_id bigint,
    partner_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.zones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.zones_id_seq OWNED BY public.zones.id;


--
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: app_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_settings ALTER COLUMN id SET DEFAULT nextval('public.app_settings_id_seq'::regclass);


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: bank_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);


--
-- Name: billings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.billings ALTER COLUMN id SET DEFAULT nextval('public.billings_id_seq'::regclass);


--
-- Name: boxes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boxes ALTER COLUMN id SET DEFAULT nextval('public.boxes_id_seq'::regclass);


--
-- Name: callback_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.callback_logs ALTER COLUMN id SET DEFAULT nextval('public.callback_logs_id_seq'::regclass);


--
-- Name: cashout_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cashout_logs ALTER COLUMN id SET DEFAULT nextval('public.cashout_logs_id_seq'::regclass);


--
-- Name: cashouts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cashouts ALTER COLUMN id SET DEFAULT nextval('public.cashouts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public.chat_messages_id_seq'::regclass);


--
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: city_mappings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_mappings ALTER COLUMN id SET DEFAULT nextval('public.city_mappings_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: coupon_merchant_finances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_merchant_finances ALTER COLUMN id SET DEFAULT nextval('public.coupon_merchant_finances_id_seq'::regclass);


--
-- Name: coupon_merchants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_merchants ALTER COLUMN id SET DEFAULT nextval('public.coupon_merchants_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons ALTER COLUMN id SET DEFAULT nextval('public.coupons_id_seq'::regclass);


--
-- Name: courier_actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_actions ALTER COLUMN id SET DEFAULT nextval('public.courier_actions_id_seq'::regclass);


--
-- Name: courier_bonuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_bonuses ALTER COLUMN id SET DEFAULT nextval('public.courier_bonuses_id_seq'::regclass);


--
-- Name: courier_enrolls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_enrolls ALTER COLUMN id SET DEFAULT nextval('public.courier_enrolls_id_seq'::regclass);


--
-- Name: courier_external_ids id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_external_ids ALTER COLUMN id SET DEFAULT nextval('public.courier_external_ids_id_seq'::regclass);


--
-- Name: courier_payment_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_payment_logs ALTER COLUMN id SET DEFAULT nextval('public.courier_payment_logs_id_seq'::regclass);


--
-- Name: courier_payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_payments ALTER COLUMN id SET DEFAULT nextval('public.courier_payments_id_seq'::regclass);


--
-- Name: couriers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.couriers ALTER COLUMN id SET DEFAULT nextval('public.couriers_id_seq'::regclass);


--
-- Name: credit_cards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards ALTER COLUMN id SET DEFAULT nextval('public.credit_cards_id_seq'::regclass);


--
-- Name: csv_exports id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.csv_exports ALTER COLUMN id SET DEFAULT nextval('public.csv_exports_id_seq'::regclass);


--
-- Name: delivery_attempts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_attempts ALTER COLUMN id SET DEFAULT nextval('public.delivery_attempts_id_seq'::regclass);


--
-- Name: delivery_partners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_partners ALTER COLUMN id SET DEFAULT nextval('public.delivery_partners_id_seq'::regclass);


--
-- Name: delivery_reward_categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_reward_categories ALTER COLUMN id SET DEFAULT nextval('public.delivery_reward_categories_id_seq'::regclass);


--
-- Name: delivery_rewards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_rewards ALTER COLUMN id SET DEFAULT nextval('public.delivery_rewards_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: exception_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exception_orders ALTER COLUMN id SET DEFAULT nextval('public.exception_orders_id_seq'::regclass);


--
-- Name: exported_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exported_files ALTER COLUMN id SET DEFAULT nextval('public.exported_files_id_seq'::regclass);


--
-- Name: external_mappers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.external_mappers ALTER COLUMN id SET DEFAULT nextval('public.external_mappers_id_seq'::regclass);


--
-- Name: finance_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_accounts ALTER COLUMN id SET DEFAULT nextval('public.finance_accounts_id_seq1'::regclass);


--
-- Name: finance_amounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_amounts ALTER COLUMN id SET DEFAULT nextval('public.finance_amounts_id_seq'::regclass);


--
-- Name: finance_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_entries ALTER COLUMN id SET DEFAULT nextval('public.finance_entries_id_seq1'::regclass);


--
-- Name: foodics_merchants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foodics_merchants ALTER COLUMN id SET DEFAULT nextval('public.foodics_merchants_id_seq'::regclass);


--
-- Name: group_shipments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_shipments ALTER COLUMN id SET DEFAULT nextval('public.group_shipments_id_seq'::regclass);


--
-- Name: hub_users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hub_users ALTER COLUMN id SET DEFAULT nextval('public.hub_users_id_seq'::regclass);


--
-- Name: hubs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hubs ALTER COLUMN id SET DEFAULT nextval('public.hubs_id_seq'::regclass);


--
-- Name: hubs_neighborhoods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hubs_neighborhoods ALTER COLUMN id SET DEFAULT nextval('public.hubs_neighborhoods_id_seq'::regclass);


--
-- Name: merchant_city_partners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_city_partners ALTER COLUMN id SET DEFAULT nextval('public.merchant_city_partners_id_seq'::regclass);


--
-- Name: merchant_finances id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_finances ALTER COLUMN id SET DEFAULT nextval('public.merchant_finances_id_seq'::regclass);


--
-- Name: merchant_suppliers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_suppliers ALTER COLUMN id SET DEFAULT nextval('public.merchant_suppliers_id_seq'::regclass);


--
-- Name: merchants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchants ALTER COLUMN id SET DEFAULT nextval('public.merchants_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: mobile_devices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mobile_devices ALTER COLUMN id SET DEFAULT nextval('public.mobile_devices_id_seq'::regclass);


--
-- Name: neighborhoods id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.neighborhoods ALTER COLUMN id SET DEFAULT nextval('public.neighborhoods_id_seq'::regclass);


--
-- Name: order_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_logs ALTER COLUMN id SET DEFAULT nextval('public.order_logs_id_seq'::regclass);


--
-- Name: order_payments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payments ALTER COLUMN id SET DEFAULT nextval('public.order_payments_id_seq'::regclass);


--
-- Name: order_routes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_routes ALTER COLUMN id SET DEFAULT nextval('public.order_routes_id_seq'::regclass);


--
-- Name: order_status_reasons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_status_reasons ALTER COLUMN id SET DEFAULT nextval('public.order_status_reasons_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: otp_verifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_verifications ALTER COLUMN id SET DEFAULT nextval('public.otp_verifications_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: payment_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_types ALTER COLUMN id SET DEFAULT nextval('public.payment_types_id_seq'::regclass);


--
-- Name: points id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.points ALTER COLUMN id SET DEFAULT nextval('public.points_id_seq'::regclass);


--
-- Name: process_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.process_logs ALTER COLUMN id SET DEFAULT nextval('public.process_logs_id_seq'::regclass);


--
-- Name: referrals id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals ALTER COLUMN id SET DEFAULT nextval('public.referrals_id_seq'::regclass);


--
-- Name: scorecards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scorecards ALTER COLUMN id SET DEFAULT nextval('public.scorecards_id_seq'::regclass);


--
-- Name: shipment_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipment_assignments ALTER COLUMN id SET DEFAULT nextval('public.shipment_assignments_id_seq'::regclass);


--
-- Name: shipment_types id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipment_types ALTER COLUMN id SET DEFAULT nextval('public.shipment_types_id_seq'::regclass);


--
-- Name: shipments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments ALTER COLUMN id SET DEFAULT nextval('public.shipments_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);


--
-- Name: system_settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_settings ALTER COLUMN id SET DEFAULT nextval('public.system_settings_id_seq'::regclass);


--
-- Name: tmp_finance_accounts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmp_finance_accounts ALTER COLUMN id SET DEFAULT nextval('public.finance_accounts_id_seq'::regclass);


--
-- Name: tmp_finance_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmp_finance_entries ALTER COLUMN id SET DEFAULT nextval('public.finance_entries_id_seq'::regclass);


--
-- Name: torod_city_couriers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torod_city_couriers ALTER COLUMN id SET DEFAULT nextval('public.torod_city_couriers_id_seq'::regclass);


--
-- Name: torod_couriers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torod_couriers ALTER COLUMN id SET DEFAULT nextval('public.torod_couriers_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vat_addresses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vat_addresses ALTER COLUMN id SET DEFAULT nextval('public.vat_addresses_id_seq'::regclass);


--
-- Name: vehicle_assignments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_assignments ALTER COLUMN id SET DEFAULT nextval('public.vehicle_assignments_id_seq'::regclass);


--
-- Name: vehicles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicles ALTER COLUMN id SET DEFAULT nextval('public.vehicles_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: wallets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallets ALTER COLUMN id SET DEFAULT nextval('public.wallets_id_seq'::regclass);


--
-- Name: webhooks_request_stores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_request_stores ALTER COLUMN id SET DEFAULT nextval('public.webhooks_request_stores_id_seq'::regclass);


--
-- Name: zatca_invoices id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zatca_invoices ALTER COLUMN id SET DEFAULT nextval('public.zatca_invoices_id_seq'::regclass);


--
-- Name: zid_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zid_logs ALTER COLUMN id SET DEFAULT nextval('public.zid_logs_id_seq'::regclass);


--
-- Name: zid_webhook_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zid_webhook_logs ALTER COLUMN id SET DEFAULT nextval('public.zid_webhook_logs_id_seq'::regclass);


--
-- Name: zones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones ALTER COLUMN id SET DEFAULT nextval('public.zones_id_seq'::regclass);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: billings billings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.billings
    ADD CONSTRAINT billings_pkey PRIMARY KEY (id);


--
-- Name: boxes boxes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.boxes
    ADD CONSTRAINT boxes_pkey PRIMARY KEY (id);


--
-- Name: callback_logs callback_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.callback_logs
    ADD CONSTRAINT callback_logs_pkey PRIMARY KEY (id);


--
-- Name: cashout_logs cashout_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cashout_logs
    ADD CONSTRAINT cashout_logs_pkey PRIMARY KEY (id);


--
-- Name: cashouts cashouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cashouts
    ADD CONSTRAINT cashouts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: chat_messages chat_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT chat_messages_pkey PRIMARY KEY (id);


--
-- Name: chats chats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chats
    ADD CONSTRAINT chats_pkey PRIMARY KEY (id);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: city_mappings city_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.city_mappings
    ADD CONSTRAINT city_mappings_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: coupon_merchant_finances coupon_merchant_finances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_merchant_finances
    ADD CONSTRAINT coupon_merchant_finances_pkey PRIMARY KEY (id);


--
-- Name: coupon_merchants coupon_merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_merchants
    ADD CONSTRAINT coupon_merchants_pkey PRIMARY KEY (id);


--
-- Name: coupons coupons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT coupons_pkey PRIMARY KEY (id);


--
-- Name: courier_actions courier_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_actions
    ADD CONSTRAINT courier_actions_pkey PRIMARY KEY (id);


--
-- Name: courier_bonuses courier_bonuses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_bonuses
    ADD CONSTRAINT courier_bonuses_pkey PRIMARY KEY (id);


--
-- Name: courier_enrolls courier_enrolls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_enrolls
    ADD CONSTRAINT courier_enrolls_pkey PRIMARY KEY (id);


--
-- Name: courier_external_ids courier_external_ids_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_external_ids
    ADD CONSTRAINT courier_external_ids_pkey PRIMARY KEY (id);


--
-- Name: courier_payment_logs courier_payment_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_payment_logs
    ADD CONSTRAINT courier_payment_logs_pkey PRIMARY KEY (id);


--
-- Name: courier_payments courier_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_payments
    ADD CONSTRAINT courier_payments_pkey PRIMARY KEY (id);


--
-- Name: couriers couriers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.couriers
    ADD CONSTRAINT couriers_pkey PRIMARY KEY (id);


--
-- Name: credit_cards credit_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.credit_cards
    ADD CONSTRAINT credit_cards_pkey PRIMARY KEY (id);


--
-- Name: csv_exports csv_exports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.csv_exports
    ADD CONSTRAINT csv_exports_pkey PRIMARY KEY (id);


--
-- Name: delivery_attempts delivery_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_attempts
    ADD CONSTRAINT delivery_attempts_pkey PRIMARY KEY (id);


--
-- Name: delivery_partners delivery_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_partners
    ADD CONSTRAINT delivery_partners_pkey PRIMARY KEY (id);


--
-- Name: delivery_reward_categories delivery_reward_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_reward_categories
    ADD CONSTRAINT delivery_reward_categories_pkey PRIMARY KEY (id);


--
-- Name: delivery_rewards delivery_rewards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_rewards
    ADD CONSTRAINT delivery_rewards_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: exception_orders exception_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exception_orders
    ADD CONSTRAINT exception_orders_pkey PRIMARY KEY (id);


--
-- Name: exported_files exported_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exported_files
    ADD CONSTRAINT exported_files_pkey PRIMARY KEY (id);


--
-- Name: external_mappers external_mappers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.external_mappers
    ADD CONSTRAINT external_mappers_pkey PRIMARY KEY (id);


--
-- Name: tmp_finance_accounts finance_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmp_finance_accounts
    ADD CONSTRAINT finance_accounts_pkey PRIMARY KEY (id);


--
-- Name: finance_accounts finance_accounts_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_accounts
    ADD CONSTRAINT finance_accounts_pkey1 PRIMARY KEY (id);


--
-- Name: finance_amounts finance_amounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_amounts
    ADD CONSTRAINT finance_amounts_pkey PRIMARY KEY (id);


--
-- Name: tmp_finance_entries finance_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmp_finance_entries
    ADD CONSTRAINT finance_entries_pkey PRIMARY KEY (id);


--
-- Name: finance_entries finance_entries_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_entries
    ADD CONSTRAINT finance_entries_pkey1 PRIMARY KEY (id);


--
-- Name: foodics_merchants foodics_merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.foodics_merchants
    ADD CONSTRAINT foodics_merchants_pkey PRIMARY KEY (id);


--
-- Name: group_shipments group_shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_shipments
    ADD CONSTRAINT group_shipments_pkey PRIMARY KEY (id);


--
-- Name: hub_users hub_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hub_users
    ADD CONSTRAINT hub_users_pkey PRIMARY KEY (id);


--
-- Name: hubs_neighborhoods hubs_neighborhoods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hubs_neighborhoods
    ADD CONSTRAINT hubs_neighborhoods_pkey PRIMARY KEY (id);


--
-- Name: hubs hubs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hubs
    ADD CONSTRAINT hubs_pkey PRIMARY KEY (id);


--
-- Name: merchant_city_partners merchant_city_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_city_partners
    ADD CONSTRAINT merchant_city_partners_pkey PRIMARY KEY (id);


--
-- Name: merchant_finances merchant_finances_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_finances
    ADD CONSTRAINT merchant_finances_pkey PRIMARY KEY (id);


--
-- Name: merchant_suppliers merchant_suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_suppliers
    ADD CONSTRAINT merchant_suppliers_pkey PRIMARY KEY (id);


--
-- Name: merchants merchants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchants
    ADD CONSTRAINT merchants_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: mobile_devices mobile_devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mobile_devices
    ADD CONSTRAINT mobile_devices_pkey PRIMARY KEY (id);


--
-- Name: neighborhoods neighborhoods_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.neighborhoods
    ADD CONSTRAINT neighborhoods_pkey PRIMARY KEY (id);


--
-- Name: order_logs order_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_logs
    ADD CONSTRAINT order_logs_pkey PRIMARY KEY (id);


--
-- Name: order_payments order_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_payments
    ADD CONSTRAINT order_payments_pkey PRIMARY KEY (id);


--
-- Name: order_routes order_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_routes
    ADD CONSTRAINT order_routes_pkey PRIMARY KEY (id);


--
-- Name: order_status_reasons order_status_reasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_status_reasons
    ADD CONSTRAINT order_status_reasons_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: otp_verifications otp_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.otp_verifications
    ADD CONSTRAINT otp_verifications_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: payment_types payment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_types
    ADD CONSTRAINT payment_types_pkey PRIMARY KEY (id);


--
-- Name: points points_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.points
    ADD CONSTRAINT points_pkey PRIMARY KEY (id);


--
-- Name: process_logs process_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.process_logs
    ADD CONSTRAINT process_logs_pkey PRIMARY KEY (id);


--
-- Name: referrals referrals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.referrals
    ADD CONSTRAINT referrals_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: scorecards scorecards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scorecards
    ADD CONSTRAINT scorecards_pkey PRIMARY KEY (id);


--
-- Name: shipment_assignments shipment_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipment_assignments
    ADD CONSTRAINT shipment_assignments_pkey PRIMARY KEY (id);


--
-- Name: shipment_types shipment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipment_types
    ADD CONSTRAINT shipment_types_pkey PRIMARY KEY (id);


--
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);


--
-- Name: system_settings system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_settings
    ADD CONSTRAINT system_settings_pkey PRIMARY KEY (id);


--
-- Name: torod_city_couriers torod_city_couriers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torod_city_couriers
    ADD CONSTRAINT torod_city_couriers_pkey PRIMARY KEY (id);


--
-- Name: torod_couriers torod_couriers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.torod_couriers
    ADD CONSTRAINT torod_couriers_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vat_addresses vat_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vat_addresses
    ADD CONSTRAINT vat_addresses_pkey PRIMARY KEY (id);


--
-- Name: vehicle_assignments vehicle_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_assignments
    ADD CONSTRAINT vehicle_assignments_pkey PRIMARY KEY (id);


--
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- Name: webhooks_request_stores webhooks_request_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webhooks_request_stores
    ADD CONSTRAINT webhooks_request_stores_pkey PRIMARY KEY (id);


--
-- Name: zatca_invoices zatca_invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zatca_invoices
    ADD CONSTRAINT zatca_invoices_pkey PRIMARY KEY (id);


--
-- Name: zid_logs zid_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zid_logs
    ADD CONSTRAINT zid_logs_pkey PRIMARY KEY (id);


--
-- Name: zid_webhook_logs zid_webhook_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zid_webhook_logs
    ADD CONSTRAINT zid_webhook_logs_pkey PRIMARY KEY (id);


--
-- Name: zones zones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zones
    ADD CONSTRAINT zones_pkey PRIMARY KEY (id);


--
-- Name: index_accounts_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_accounts_on_email ON public.accounts USING btree (email);


--
-- Name: index_accounts_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_accounts_on_reset_password_token ON public.accounts USING btree (reset_password_token);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_addresses_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_city_id ON public.addresses USING btree (city_id);


--
-- Name: index_addresses_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_country_id ON public.addresses USING btree (country_id);


--
-- Name: index_addresses_on_phone_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_phone_number ON public.addresses USING btree (phone_number);


--
-- Name: index_addresses_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_user_id ON public.addresses USING btree (user_id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admins_on_email ON public.admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON public.admins USING btree (reset_password_token);


--
-- Name: index_admins_on_warehouse_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_admins_on_warehouse_id ON public.admins USING btree (warehouse_id);


--
-- Name: index_amounts_on_accounts_entries; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_amounts_on_accounts_entries ON public.finance_amounts USING btree (finance_account_id, finance_entry_id);


--
-- Name: index_app_settings_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_app_settings_on_name ON public.app_settings USING btree (name);


--
-- Name: index_bank_accounts_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bank_accounts_on_city_id ON public.bank_accounts USING btree (city_id);


--
-- Name: index_bank_accounts_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_bank_accounts_on_country_id ON public.bank_accounts USING btree (country_id);


--
-- Name: index_billings_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_billings_on_merchant_id ON public.billings USING btree (merchant_id);


--
-- Name: index_boxes_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_boxes_on_order_id ON public.boxes USING btree (order_id);


--
-- Name: index_boxes_on_tracking_no; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_boxes_on_tracking_no ON public.boxes USING btree (tracking_no);


--
-- Name: index_callback_logs_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_callback_logs_on_order_id ON public.callback_logs USING btree (order_id);


--
-- Name: index_cashout_logs_on_cashout_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cashout_logs_on_cashout_id ON public.cashout_logs USING btree (cashout_id);


--
-- Name: index_cashouts_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cashouts_on_courier_id ON public.cashouts USING btree (courier_id);


--
-- Name: index_cashouts_on_tranzaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cashouts_on_tranzaction_id ON public.cashouts USING btree (tranzaction_id);


--
-- Name: index_cashouts_on_wallet_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cashouts_on_wallet_id ON public.cashouts USING btree (wallet_id);


--
-- Name: index_categories_merchants_on_merchant_id_and_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_merchants_on_merchant_id_and_category_id ON public.categories_merchants USING btree (merchant_id, category_id);


--
-- Name: index_chat_messages_on_chat_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_chat_messages_on_chat_id ON public.chat_messages USING btree (chat_id);


--
-- Name: index_comments_on_commentable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable_id ON public.comments USING btree (commentable_id);


--
-- Name: index_comments_on_commentable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable_type ON public.comments USING btree (commentable_type);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_user_id ON public.comments USING btree (user_id);


--
-- Name: index_coupon_merchant_finances_on_coupon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_coupon_merchant_finances_on_coupon_id ON public.coupon_merchant_finances USING btree (coupon_id);


--
-- Name: index_coupon_merchant_finances_on_merchant_finance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_coupon_merchant_finances_on_merchant_finance_id ON public.coupon_merchant_finances USING btree (merchant_finance_id);


--
-- Name: index_coupon_merchants_on_coupon_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_coupon_merchants_on_coupon_id ON public.coupon_merchants USING btree (coupon_id);


--
-- Name: index_coupon_merchants_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_coupon_merchants_on_merchant_id ON public.coupon_merchants USING btree (merchant_id);


--
-- Name: index_courier_actions_on_action_type_and_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_actions_on_action_type_and_courier_id ON public.courier_actions USING btree (action_type, courier_id);


--
-- Name: index_courier_actions_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_actions_on_courier_id ON public.courier_actions USING btree (courier_id);


--
-- Name: index_courier_actions_on_courier_id_and_action_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_actions_on_courier_id_and_action_type ON public.courier_actions USING btree (courier_id, action_type);


--
-- Name: index_courier_actions_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_actions_on_merchant_id ON public.courier_actions USING btree (merchant_id);


--
-- Name: index_courier_actions_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_actions_on_order_id ON public.courier_actions USING btree (order_id);


--
-- Name: index_courier_bonuses_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_bonuses_on_courier_id ON public.courier_bonuses USING btree (courier_id);


--
-- Name: index_courier_bonuses_on_transaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_bonuses_on_transaction_id ON public.courier_bonuses USING btree (transaction_id);


--
-- Name: index_courier_enrolls_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_enrolls_on_city_id ON public.courier_enrolls USING btree (city_id);


--
-- Name: index_courier_enrolls_on_credentials_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_courier_enrolls_on_credentials_token ON public.courier_enrolls USING btree (credentials_token);


--
-- Name: index_courier_external_ids_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_external_ids_on_courier_id ON public.courier_external_ids USING btree (courier_id);


--
-- Name: index_courier_external_ids_on_name_and_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_external_ids_on_name_and_value ON public.courier_external_ids USING btree (name, value);


--
-- Name: index_courier_external_ids_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_external_ids_on_status ON public.courier_external_ids USING btree (status);


--
-- Name: index_courier_payment_logs_on_courier_payment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_payment_logs_on_courier_payment_id ON public.courier_payment_logs USING btree (courier_payment_id);


--
-- Name: index_courier_payments_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_payments_on_courier_id ON public.courier_payments USING btree (courier_id);


--
-- Name: index_courier_payments_on_courier_id_and_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_payments_on_courier_id_and_status ON public.courier_payments USING btree (courier_id, status);


--
-- Name: index_courier_payments_on_reference_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_payments_on_reference_number ON public.courier_payments USING btree (reference_number);


--
-- Name: index_courier_payments_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_courier_payments_on_status ON public.courier_payments USING btree (status);


--
-- Name: index_couriers_hubs_on_courier_id_and_hub_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_hubs_on_courier_id_and_hub_id ON public.couriers_hubs USING btree (courier_id, hub_id);


--
-- Name: index_couriers_merchants_on_courier_id_and_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_merchants_on_courier_id_and_merchant_id ON public.couriers_merchants USING btree (courier_id, merchant_id);


--
-- Name: index_couriers_neighborhoods_on_courier_id_and_neighborhood_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_neighborhoods_on_courier_id_and_neighborhood_id ON public.couriers_neighborhoods USING btree (courier_id, neighborhood_id);


--
-- Name: index_couriers_on_banned_by_type_and_banned_by_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_on_banned_by_type_and_banned_by_id ON public.couriers USING btree (banned_by_type, banned_by_id);


--
-- Name: index_couriers_on_citc_info; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_on_citc_info ON public.couriers USING gin (citc_info);


--
-- Name: index_couriers_on_hub_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_on_hub_id ON public.couriers USING btree (hub_id);


--
-- Name: index_couriers_on_imei; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_on_imei ON public.couriers USING btree (imei);


--
-- Name: index_couriers_on_official_info; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_on_official_info ON public.couriers USING gin (official_info);


--
-- Name: index_couriers_on_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_couriers_on_partner_id ON public.couriers USING btree (partner_id);


--
-- Name: index_credit_cards_on_owner_type_and_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_credit_cards_on_owner_type_and_owner_id ON public.credit_cards USING btree (owner_type, owner_id);


--
-- Name: index_csv_exports_on_admin_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_csv_exports_on_admin_id ON public.csv_exports USING btree (admin_id);


--
-- Name: index_delivery_attempts_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_attempts_on_courier_id ON public.delivery_attempts USING btree (courier_id);


--
-- Name: index_delivery_attempts_on_failure_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_attempts_on_failure_reason_id ON public.delivery_attempts USING btree (failure_reason_id);


--
-- Name: index_delivery_attempts_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_attempts_on_order_id ON public.delivery_attempts USING btree (order_id);


--
-- Name: index_delivery_partners_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_delivery_partners_on_key ON public.delivery_partners USING btree (key);


--
-- Name: index_delivery_reward_categories_on_initial_fee_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_reward_categories_on_initial_fee_id ON public.delivery_reward_categories USING btree (initial_fee_id);


--
-- Name: index_delivery_rewards_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_rewards_on_courier_id ON public.delivery_rewards USING btree (courier_id);


--
-- Name: index_delivery_rewards_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_rewards_on_order_id ON public.delivery_rewards USING btree (order_id);


--
-- Name: index_delivery_rewards_on_shipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_delivery_rewards_on_shipment_id ON public.delivery_rewards USING btree (shipment_id);


--
-- Name: index_documents_on_documentable_type_and_documentable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_documents_on_documentable_type_and_documentable_id ON public.documents USING btree (documentable_type, documentable_id);


--
-- Name: index_exported_files_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exported_files_on_merchant_id ON public.exported_files USING btree (merchant_id);


--
-- Name: index_external_mappers_on_extra_details; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_external_mappers_on_extra_details ON public.external_mappers USING gin (extra_details);


--
-- Name: index_external_mappers_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_external_mappers_on_type ON public.external_mappers USING btree (type);


--
-- Name: index_external_mappers_on_type_external_service_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_external_mappers_on_type_external_service_key ON public.external_mappers USING btree (type, external_service, service_key);


--
-- Name: index_finance_accounts_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_accounts_on_name ON public.finance_accounts USING btree (name);


--
-- Name: index_finance_accounts_on_owner_type_and_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_accounts_on_owner_type_and_owner_id ON public.finance_accounts USING btree (owner_type, owner_id);


--
-- Name: index_finance_accounts_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_accounts_on_type ON public.finance_accounts USING btree (type);


--
-- Name: index_finance_amounts_on_finance_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_amounts_on_finance_account_id ON public.finance_amounts USING btree (finance_account_id);


--
-- Name: index_finance_amounts_on_finance_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_amounts_on_finance_entry_id ON public.finance_amounts USING btree (finance_entry_id);


--
-- Name: index_finance_amounts_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_amounts_on_type ON public.finance_amounts USING btree (type);


--
-- Name: index_finance_entries_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_courier_id ON public.finance_entries USING btree (courier_id);


--
-- Name: index_finance_entries_on_document_type_and_document_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_document_type_and_document_id ON public.tmp_finance_entries USING btree (document_type, document_id);


--
-- Name: index_finance_entries_on_from_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_from_account_id ON public.tmp_finance_entries USING btree (from_account_id);


--
-- Name: index_finance_entries_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_merchant_id ON public.finance_entries USING btree (merchant_id);


--
-- Name: index_finance_entries_on_object_type_and_object_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_object_type_and_object_id ON public.finance_entries USING btree (object_type, object_id);


--
-- Name: index_finance_entries_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_order_id ON public.finance_entries USING btree (order_id);


--
-- Name: index_finance_entries_on_reversing_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_reversing_entry_id ON public.finance_entries USING btree (reversing_entry_id);


--
-- Name: index_finance_entries_on_to_account_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_finance_entries_on_to_account_id ON public.tmp_finance_entries USING btree (to_account_id);


--
-- Name: index_foodics_merchants_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_foodics_merchants_on_merchant_id ON public.foodics_merchants USING btree (merchant_id);


--
-- Name: index_group_shipments_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_group_shipments_on_courier_id ON public.group_shipments USING btree (courier_id);


--
-- Name: index_hub_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_hub_users_on_email ON public.hub_users USING btree (email);


--
-- Name: index_hub_users_on_hub_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hub_users_on_hub_id ON public.hub_users USING btree (hub_id);


--
-- Name: index_hub_users_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hub_users_on_merchant_id ON public.hub_users USING btree (merchant_id);


--
-- Name: index_hub_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_hub_users_on_reset_password_token ON public.hub_users USING btree (reset_password_token);


--
-- Name: index_hubs_neighborhoods_on_hub_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_neighborhoods_on_hub_id ON public.hubs_neighborhoods USING btree (hub_id);


--
-- Name: index_hubs_neighborhoods_on_neighborhood_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_neighborhoods_on_neighborhood_id ON public.hubs_neighborhoods USING btree (neighborhood_id);


--
-- Name: index_hubs_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_city_id ON public.hubs USING btree (city_id);


--
-- Name: index_hubs_on_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_code ON public.hubs USING btree (code);


--
-- Name: index_hubs_on_flags; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_flags ON public.hubs USING btree (flags);


--
-- Name: index_hubs_on_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_is_active ON public.hubs USING btree (is_active);


--
-- Name: index_hubs_on_is_open; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_is_open ON public.hubs USING btree (is_open);


--
-- Name: index_hubs_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_merchant_id ON public.hubs USING btree (merchant_id);


--
-- Name: index_hubs_on_neighborhood_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_neighborhood_id ON public.hubs USING btree (neighborhood_id);


--
-- Name: index_hubs_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_store_id ON public.hubs USING btree (store_id);


--
-- Name: index_hubs_on_torod_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_hubs_on_torod_id ON public.hubs USING btree (torod_id);


--
-- Name: index_merchant_city_partners_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_city_partners_on_city_id ON public.merchant_city_partners USING btree (city_id);


--
-- Name: index_merchant_city_partners_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_city_partners_on_merchant_id ON public.merchant_city_partners USING btree (merchant_id);


--
-- Name: index_merchant_city_partners_on_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_city_partners_on_partner_id ON public.merchant_city_partners USING btree (partner_id);


--
-- Name: index_merchant_suppliers_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_suppliers_on_city_id ON public.merchant_suppliers USING btree (city_id);


--
-- Name: index_merchant_suppliers_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_suppliers_on_merchant_id ON public.merchant_suppliers USING btree (merchant_id);


--
-- Name: index_merchant_suppliers_on_supplier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchant_suppliers_on_supplier_id ON public.merchant_suppliers USING btree (supplier_id);


--
-- Name: index_merchants_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchants_on_country_id ON public.merchants USING btree (country_id);


--
-- Name: index_merchants_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_merchants_on_email ON public.merchants USING btree (email);


--
-- Name: index_merchants_on_manager_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchants_on_manager_merchant_id ON public.merchants USING btree (manager_merchant_id);


--
-- Name: index_merchants_on_merchant_finance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchants_on_merchant_finance_id ON public.merchants USING btree (merchant_finance_id);


--
-- Name: index_merchants_on_notification_mechanism; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchants_on_notification_mechanism ON public.merchants USING btree (notification_mechanism);


--
-- Name: index_merchants_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_merchants_on_reset_password_token ON public.merchants USING btree (reset_password_token);


--
-- Name: index_merchants_partners_on_merchant_id_and_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchants_partners_on_merchant_id_and_partner_id ON public.merchants_partners USING btree (merchant_id, partner_id);


--
-- Name: index_merchants_partners_on_partner_id_and_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merchants_partners_on_partner_id_and_merchant_id ON public.merchants_partners USING btree (partner_id, merchant_id);


--
-- Name: index_messages_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_messages_on_merchant_id ON public.messages USING btree (merchant_id);


--
-- Name: index_mobile_devices_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mobile_devices_on_city_id ON public.mobile_devices USING btree (city_id);


--
-- Name: index_mobile_devices_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mobile_devices_on_country_id ON public.mobile_devices USING btree (country_id);


--
-- Name: index_mobile_devices_on_device_unique_id_and_device_type; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_mobile_devices_on_device_unique_id_and_device_type ON public.mobile_devices USING btree (device_unique_id, device_type);


--
-- Name: index_mobile_devices_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_mobile_devices_on_user_id ON public.mobile_devices USING btree (user_id);


--
-- Name: index_neighborhoods_on_bounds; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_neighborhoods_on_bounds ON public.neighborhoods USING gin (bounds);


--
-- Name: index_neighborhoods_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_neighborhoods_on_city_id ON public.neighborhoods USING btree (city_id);


--
-- Name: index_neighborhoods_on_geom; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_neighborhoods_on_geom ON public.neighborhoods USING gist (geom);


--
-- Name: index_neighborhoods_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_neighborhoods_on_name ON public.neighborhoods USING gin (name);


--
-- Name: index_neighborhoods_zones_on_zone_id_and_neighborhood_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_neighborhoods_zones_on_zone_id_and_neighborhood_id ON public.neighborhoods_zones USING btree (zone_id, neighborhood_id);


--
-- Name: index_order_logs_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_logs_on_order_id ON public.order_logs USING btree (order_id);


--
-- Name: index_order_logs_on_order_status_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_logs_on_order_status_reason_id ON public.order_logs USING btree (order_status_reason_id);


--
-- Name: index_order_payments_on_external_reference_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_payments_on_external_reference_id ON public.order_payments USING btree (external_reference_id);


--
-- Name: index_order_payments_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_payments_on_merchant_id ON public.order_payments USING btree (merchant_id);


--
-- Name: index_order_payments_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_payments_on_order_id ON public.order_payments USING btree (order_id);


--
-- Name: index_order_payments_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_payments_on_status ON public.order_payments USING btree (status);


--
-- Name: index_order_payments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_payments_on_user_id ON public.order_payments USING btree (user_id);


--
-- Name: index_order_routes_on_delivery_reward_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_routes_on_delivery_reward_category_id ON public.order_routes USING btree (delivery_reward_category_id);


--
-- Name: index_order_routes_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_routes_on_order_id ON public.order_routes USING btree (order_id);


--
-- Name: index_order_routes_on_shipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_order_routes_on_shipment_id ON public.order_routes USING btree (shipment_id);


--
-- Name: index_order_status_reasons_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_order_status_reasons_on_key ON public.order_status_reasons USING btree (key);


--
-- Name: index_orders_on_alternate_contact; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_alternate_contact ON public.orders USING gin (alternate_contact);


--
-- Name: index_orders_on_billing_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_billing_id ON public.orders USING btree (billing_id);


--
-- Name: index_orders_on_connected_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_connected_order_id ON public.orders USING btree (connected_order_id);


--
-- Name: index_orders_on_connected_order_info; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_connected_order_info ON public.orders USING gin (connected_order_info);


--
-- Name: index_orders_on_connected_to_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_connected_to_order_id ON public.orders USING btree (connected_to_order_id);


--
-- Name: index_orders_on_customer_details; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_customer_details ON public.orders USING gin (customer_details);


--
-- Name: index_orders_on_destination; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_destination ON public.orders USING gin (destination);


--
-- Name: index_orders_on_dropoff_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_dropoff_address_id ON public.orders USING btree (dropoff_address_id);


--
-- Name: index_orders_on_hub_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_hub_id ON public.orders USING btree (hub_id);


--
-- Name: index_orders_on_hub_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_hub_user_id ON public.orders USING btree (hub_user_id);


--
-- Name: index_orders_on_is_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_is_active ON public.orders USING btree (is_active);


--
-- Name: index_orders_on_is_assigned; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_is_assigned ON public.orders USING btree (is_assigned);


--
-- Name: index_orders_on_is_completed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_is_completed ON public.orders USING btree (is_completed);


--
-- Name: index_orders_on_is_returned; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_is_returned ON public.orders USING btree (is_returned);


--
-- Name: index_orders_on_merchant_finance_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_merchant_finance_id ON public.orders USING btree (merchant_finance_id);


--
-- Name: index_orders_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_merchant_id ON public.orders USING btree (merchant_id);


--
-- Name: index_orders_on_merchant_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_merchant_order_id ON public.orders USING btree (merchant_order_id);


--
-- Name: index_orders_on_merchant_tracking_no; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_merchant_tracking_no ON public.orders USING btree (merchant_tracking_no);


--
-- Name: index_orders_on_neighborhood_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_neighborhood_id ON public.orders USING btree (neighborhood_id);


--
-- Name: index_orders_on_order_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_order_status ON public.orders USING btree (order_status);


--
-- Name: index_orders_on_order_status_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_order_status_reason_id ON public.orders USING btree (order_status_reason_id);


--
-- Name: index_orders_on_order_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_order_type ON public.orders USING btree (order_type);


--
-- Name: index_orders_on_pickup_address_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_pickup_address_id ON public.orders USING btree (pickup_address_id);


--
-- Name: index_orders_on_products; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_products ON public.orders USING gin (products);


--
-- Name: index_orders_on_ready_since; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_ready_since ON public.orders USING btree (ready_since);


--
-- Name: index_orders_on_shipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_shipment_id ON public.orders USING btree (shipment_id);


--
-- Name: index_orders_on_shipment_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_shipment_type ON public.orders USING btree (shipment_type);


--
-- Name: index_orders_on_status_coordinates; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_status_coordinates ON public.orders USING gin (status_coordinates);


--
-- Name: index_orders_on_status_times; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_status_times ON public.orders USING gin (status_times);


--
-- Name: index_orders_on_store_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_store_id ON public.orders USING btree (store_id);


--
-- Name: index_orders_on_torood_info; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_torood_info ON public.orders USING gin (torood_info);


--
-- Name: index_orders_on_tracking_no; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_tracking_no ON public.orders USING btree (tracking_no);


--
-- Name: index_orders_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_user_id ON public.orders USING btree (user_id);


--
-- Name: index_orders_on_warehouse_destination_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_warehouse_destination_id ON public.orders USING btree (warehouse_destination_id);


--
-- Name: index_orders_on_warehouse_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_warehouse_id ON public.orders USING btree (warehouse_id);


--
-- Name: index_orders_on_warehouse_origin_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_orders_on_warehouse_origin_id ON public.orders USING btree (warehouse_origin_id);


--
-- Name: index_partners_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_partners_on_email ON public.partners USING btree (email);


--
-- Name: index_partners_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_partners_on_reset_password_token ON public.partners USING btree (reset_password_token);


--
-- Name: index_points_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_points_on_user_id ON public.points USING btree (user_id);


--
-- Name: index_scorecards_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_scorecards_on_user_id ON public.scorecards USING btree (user_id);


--
-- Name: index_shipment_assignments_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipment_assignments_on_courier_id ON public.shipment_assignments USING btree (courier_id);


--
-- Name: index_shipment_assignments_on_shipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipment_assignments_on_shipment_id ON public.shipment_assignments USING btree (shipment_id);


--
-- Name: index_shipment_types_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_shipment_types_on_key ON public.shipment_types USING btree (key);


--
-- Name: index_shipments_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_courier_id ON public.shipments USING btree (courier_id);


--
-- Name: index_shipments_on_group_shipment_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_group_shipment_id ON public.shipments USING btree (group_shipment_id);


--
-- Name: index_shipments_on_is_assigned; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_is_assigned ON public.shipments USING btree (is_assigned);


--
-- Name: index_shipments_on_is_cancelled; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_is_cancelled ON public.shipments USING btree (is_cancelled);


--
-- Name: index_shipments_on_is_completed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_is_completed ON public.shipments USING btree (is_completed);


--
-- Name: index_shipments_on_latitude; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_latitude ON public.shipments USING btree (latitude);


--
-- Name: index_shipments_on_longitude; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_longitude ON public.shipments USING btree (longitude);


--
-- Name: index_shipments_on_on_hold; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_on_hold ON public.shipments USING btree (on_hold);


--
-- Name: index_shipments_on_order_status_reason_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_order_status_reason_id ON public.shipments USING btree (order_status_reason_id);


--
-- Name: index_shipments_on_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_partner_id ON public.shipments USING btree (partner_id);


--
-- Name: index_shipments_on_promise_times; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_promise_times ON public.shipments USING gin (promise_times);


--
-- Name: index_shipments_on_shipment_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_shipment_status ON public.shipments USING btree (shipment_status);


--
-- Name: index_shipments_on_tracking_no; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_shipments_on_tracking_no ON public.shipments USING btree (tracking_no);


--
-- Name: index_stores_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_stores_on_category_id ON public.stores USING btree (category_id);


--
-- Name: index_system_settings_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_system_settings_on_key ON public.system_settings USING btree (key);


--
-- Name: index_torod_city_couriers_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_torod_city_couriers_on_city_id ON public.torod_city_couriers USING btree (city_id);


--
-- Name: index_torod_city_couriers_on_torod_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_torod_city_couriers_on_torod_courier_id ON public.torod_city_couriers USING btree (torod_courier_id);


--
-- Name: index_torod_couriers_on_torod_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_torod_couriers_on_torod_id ON public.torod_couriers USING btree (torod_id);


--
-- Name: index_transactions_on_credit_card_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transactions_on_credit_card_id ON public.transactions USING btree (credit_card_id);


--
-- Name: index_transactions_on_wallet_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_transactions_on_wallet_id ON public.transactions USING btree (wallet_id);


--
-- Name: index_users_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_city_id ON public.users USING btree (city_id);


--
-- Name: index_users_on_country_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_country_id ON public.users USING btree (country_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_mobile_number; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_mobile_number ON public.users USING btree (mobile_number);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token) WHERE (reset_password_token IS NOT NULL);


--
-- Name: index_vat_addresses_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vat_addresses_on_merchant_id ON public.vat_addresses USING btree (merchant_id);


--
-- Name: index_vehicle_assignments_on_courier_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vehicle_assignments_on_courier_id ON public.vehicle_assignments USING btree (courier_id);


--
-- Name: index_vehicle_assignments_on_vehicle_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vehicle_assignments_on_vehicle_id ON public.vehicle_assignments USING btree (vehicle_id);


--
-- Name: index_vehicles_on_model_and_plate_no; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_vehicles_on_model_and_plate_no ON public.vehicles USING btree (model, plate_no);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: index_zatca_invoices_on_billing_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zatca_invoices_on_billing_id ON public.zatca_invoices USING btree (billing_id);


--
-- Name: index_zatca_invoices_on_previous_invoice_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zatca_invoices_on_previous_invoice_id ON public.zatca_invoices USING btree (previous_invoice_id);


--
-- Name: index_zid_logs_on_order_params_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zid_logs_on_order_params_code ON public.zid_logs USING btree (((order_params ->> 'code'::text)));


--
-- Name: index_zid_webhook_logs_on_merchant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zid_webhook_logs_on_merchant_id ON public.zid_webhook_logs USING btree (merchant_id);


--
-- Name: index_zones_on_city_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zones_on_city_id ON public.zones USING btree (city_id);


--
-- Name: index_zones_on_partner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_zones_on_partner_id ON public.zones USING btree (partner_id);


--
-- Name: finance_entries fk_rails_07b021975d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_entries
    ADD CONSTRAINT fk_rails_07b021975d FOREIGN KEY (reversing_entry_id) REFERENCES public.finance_entries(id);


--
-- Name: cashouts fk_rails_0b292a4a18; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cashouts
    ADD CONSTRAINT fk_rails_0b292a4a18 FOREIGN KEY (wallet_id) REFERENCES public.wallets(id);


--
-- Name: orders fk_rails_0eb0e9e545; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_0eb0e9e545 FOREIGN KEY (billing_id) REFERENCES public.billings(id);


--
-- Name: tmp_finance_entries fk_rails_0f9a644adb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmp_finance_entries
    ADD CONSTRAINT fk_rails_0f9a644adb FOREIGN KEY (to_account_id) REFERENCES public.tmp_finance_accounts(id);


--
-- Name: cashout_logs fk_rails_1b8ad25939; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cashout_logs
    ADD CONSTRAINT fk_rails_1b8ad25939 FOREIGN KEY (cashout_id) REFERENCES public.cashouts(id);


--
-- Name: finance_amounts fk_rails_1c57e473c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_amounts
    ADD CONSTRAINT fk_rails_1c57e473c3 FOREIGN KEY (finance_entry_id) REFERENCES public.finance_entries(id);


--
-- Name: chat_messages fk_rails_2024dfabfd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT fk_rails_2024dfabfd FOREIGN KEY (chat_id) REFERENCES public.chats(id);


--
-- Name: merchant_suppliers fk_rails_20800bee67; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_suppliers
    ADD CONSTRAINT fk_rails_20800bee67 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: zid_webhook_logs fk_rails_251a29df12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zid_webhook_logs
    ADD CONSTRAINT fk_rails_251a29df12 FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: messages fk_rails_2815fe6d7a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT fk_rails_2815fe6d7a FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: orders fk_rails_30bc5fac69; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_30bc5fac69 FOREIGN KEY (hub_id) REFERENCES public.hubs(id);


--
-- Name: orders fk_rails_31a4e3dfdf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_31a4e3dfdf FOREIGN KEY (neighborhood_id) REFERENCES public.neighborhoods(id);


--
-- Name: coupon_merchants fk_rails_31e472c8f2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_merchants
    ADD CONSTRAINT fk_rails_31e472c8f2 FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: merchant_suppliers fk_rails_3b1516e0e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_suppliers
    ADD CONSTRAINT fk_rails_3b1516e0e0 FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: exported_files fk_rails_3b92c7cfdd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.exported_files
    ADD CONSTRAINT fk_rails_3b92c7cfdd FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: merchant_suppliers fk_rails_3ee6accf10; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchant_suppliers
    ADD CONSTRAINT fk_rails_3ee6accf10 FOREIGN KEY (supplier_id) REFERENCES public.suppliers(id);


--
-- Name: coupon_merchant_finances fk_rails_444fc22bec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_merchant_finances
    ADD CONSTRAINT fk_rails_444fc22bec FOREIGN KEY (merchant_finance_id) REFERENCES public.merchant_finances(id);


--
-- Name: coupon_merchant_finances fk_rails_481a551462; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coupon_merchant_finances
    ADD CONSTRAINT fk_rails_481a551462 FOREIGN KEY (coupon_id) REFERENCES public.coupons(id);


--
-- Name: vehicle_assignments fk_rails_4e03f325ca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_assignments
    ADD CONSTRAINT fk_rails_4e03f325ca FOREIGN KEY (courier_id) REFERENCES public.couriers(id);


--
-- Name: delivery_attempts fk_rails_4f4fadc8a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_attempts
    ADD CONSTRAINT fk_rails_4f4fadc8a6 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: merchants fk_rails_4f7ea0766b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merchants
    ADD CONSTRAINT fk_rails_4f7ea0766b FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: courier_bonuses fk_rails_51fbe86a3e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_bonuses
    ADD CONSTRAINT fk_rails_51fbe86a3e FOREIGN KEY (courier_id) REFERENCES public.couriers(id);


--
-- Name: courier_payment_logs fk_rails_60adbd25dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_payment_logs
    ADD CONSTRAINT fk_rails_60adbd25dc FOREIGN KEY (courier_payment_id) REFERENCES public.courier_payments(id);


--
-- Name: finance_entries fk_rails_6cbf4b5f52; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_entries
    ADD CONSTRAINT fk_rails_6cbf4b5f52 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: bank_accounts fk_rails_72f29a97e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT fk_rails_72f29a97e4 FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: neighborhoods fk_rails_81a381ff87; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.neighborhoods
    ADD CONSTRAINT fk_rails_81a381ff87 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: courier_bonuses fk_rails_85a5999211; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_bonuses
    ADD CONSTRAINT fk_rails_85a5999211 FOREIGN KEY (transaction_id) REFERENCES public.transactions(id);


--
-- Name: group_shipments fk_rails_85b30ec2de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.group_shipments
    ADD CONSTRAINT fk_rails_85b30ec2de FOREIGN KEY (courier_id) REFERENCES public.couriers(id);


--
-- Name: hubs_neighborhoods fk_rails_8e671cd5c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hubs_neighborhoods
    ADD CONSTRAINT fk_rails_8e671cd5c6 FOREIGN KEY (neighborhood_id) REFERENCES public.neighborhoods(id);


--
-- Name: order_logs fk_rails_921d313d08; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_logs
    ADD CONSTRAINT fk_rails_921d313d08 FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: couriers fk_rails_92acc67a67; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.couriers
    ADD CONSTRAINT fk_rails_92acc67a67 FOREIGN KEY (hub_id) REFERENCES public.hubs(id);


--
-- Name: billings fk_rails_9eb8cf6172; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.billings
    ADD CONSTRAINT fk_rails_9eb8cf6172 FOREIGN KEY (merchant_id) REFERENCES public.merchants(id);


--
-- Name: courier_enrolls fk_rails_a05c489eb1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_enrolls
    ADD CONSTRAINT fk_rails_a05c489eb1 FOREIGN KEY (city_id) REFERENCES public.cities(id);


--
-- Name: tmp_finance_entries fk_rails_a09887b280; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tmp_finance_entries
    ADD CONSTRAINT fk_rails_a09887b280 FOREIGN KEY (from_account_id) REFERENCES public.tmp_finance_accounts(id);


--
-- Name: finance_amounts fk_rails_b1f15fa01d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.finance_amounts
    ADD CONSTRAINT fk_rails_b1f15fa01d FOREIGN KEY (finance_account_id) REFERENCES public.finance_accounts(id);


--
-- Name: vehicle_assignments fk_rails_b46c6d55cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vehicle_assignments
    ADD CONSTRAINT fk_rails_b46c6d55cc FOREIGN KEY (vehicle_id) REFERENCES public.vehicles(id);


--
-- Name: hubs_neighborhoods fk_rails_bab2d8da72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.hubs_neighborhoods
    ADD CONSTRAINT fk_rails_bab2d8da72 FOREIGN KEY (hub_id) REFERENCES public.hubs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: delivery_attempts fk_rails_c69655b015; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_attempts
    ADD CONSTRAINT fk_rails_c69655b015 FOREIGN KEY (courier_id) REFERENCES public.couriers(id);


--
-- Name: zatca_invoices fk_rails_cbee5eeed5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.zatca_invoices
    ADD CONSTRAINT fk_rails_cbee5eeed5 FOREIGN KEY (billing_id) REFERENCES public.billings(id);


--
-- Name: orders fk_rails_db9364dc56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_db9364dc56 FOREIGN KEY (merchant_finance_id) REFERENCES public.merchant_finances(id);


--
-- Name: orders fk_rails_f0be2fda72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_f0be2fda72 FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- Name: mobile_devices fk_rails_f61b19cc7b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mobile_devices
    ADD CONSTRAINT fk_rails_f61b19cc7b FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: courier_payments fk_rails_f61bc604e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courier_payments
    ADD CONSTRAINT fk_rails_f61bc604e2 FOREIGN KEY (courier_id) REFERENCES public.couriers(id);


--
-- Name: shipments fk_rails_f6a869a621; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT fk_rails_f6a869a621 FOREIGN KEY (group_shipment_id) REFERENCES public.group_shipments(id);


--
-- Name: couriers fk_rails_f96f67c65a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.couriers
    ADD CONSTRAINT fk_rails_f96f67c65a FOREIGN KEY (partner_id) REFERENCES public.partners(id);


--
-- Name: delivery_attempts fk_rails_fdcf168175; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.delivery_attempts
    ADD CONSTRAINT fk_rails_fdcf168175 FOREIGN KEY (failure_reason_id) REFERENCES public.order_status_reasons(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public, postgis;

INSERT INTO "schema_migrations" (version) VALUES
('20190614130900'),
('20190615120041'),
('20190618090107'),
('20190629143030'),
('20190629143101'),
('20190629143959'),
('20190701154712'),
('20190804115618'),
('20190805092304'),
('20190805144647'),
('20190807120055'),
('20190807152123'),
('20190807152124'),
('20190810120141'),
('20190810121243'),
('20190814195222'),
('20190818125843'),
('20190827131846'),
('20190827163545'),
('20190831144717'),
('20190831154425'),
('20190831154816'),
('20190917132326'),
('20190924121658'),
('20190924123657'),
('20190926151947'),
('20190926174412'),
('20190929165541'),
('20190930104607'),
('20190930110909'),
('20190930111946'),
('20191006172524'),
('20191007131527'),
('20191007183121'),
('20191007200909'),
('20191013132712'),
('20191013133137'),
('20191013134144'),
('20191015094140'),
('20191020174851'),
('20191022172855'),
('20191127122531'),
('20191127122532'),
('20191201052528'),
('20191201082527'),
('20191209120436'),
('20191218134020'),
('20191218142145'),
('20191218151107'),
('20191218160201'),
('20191218162737'),
('20191228173147'),
('20200106135234'),
('20200107061045'),
('20200107062022'),
('20200113132947'),
('20200302133042'),
('20200302142754'),
('20200308123251'),
('20200308123555'),
('20200308133720'),
('20200309100959'),
('20200312151102'),
('20200315111018'),
('20200322170627'),
('20200322171857'),
('20200322232829'),
('20200323000631'),
('20200323011334'),
('20200329213540'),
('20200329231205'),
('20200401125353'),
('20200403233620'),
('20200406194327'),
('20200406194457'),
('20200407214740'),
('20200407233748'),
('20200407233824'),
('20200408014407'),
('20200412202942'),
('20200412204748'),
('20200412204906'),
('20200412215055'),
('20200412215517'),
('20200412215552'),
('20200412225126'),
('20200412225333'),
('20200414010301'),
('20200414203042'),
('20200415225340'),
('20200416203633'),
('20200420201303'),
('20200420224720'),
('20200420224752'),
('20200423030844'),
('20200424174201'),
('20200424174516'),
('20200424174553'),
('20200427175631'),
('20200427190438'),
('20200427211725'),
('20200427211918'),
('20200429212242'),
('20200429214250'),
('20200430014734'),
('20200503052539'),
('20200503053532'),
('20200503075156'),
('20200503080643'),
('20200503082858'),
('20200503092751'),
('20200504185845'),
('20200505054722'),
('20200505054757'),
('20200506062554'),
('20200509071640'),
('20200509073559'),
('20200509084822'),
('20200509092810'),
('20200510073707'),
('20200510073843'),
('20200511065639'),
('20200512103903'),
('20200512150839'),
('20200513104249'),
('20200514054719'),
('20200514113045'),
('20200515050157'),
('20200515053342'),
('20200517115405'),
('20200519100506'),
('20200522082235'),
('20200601103231'),
('20200601153044'),
('20200601191325'),
('20200602062942'),
('20200602101408'),
('20200609075105'),
('20200610110922'),
('20200611105632'),
('20200611105846'),
('20200615093113'),
('20200615130955'),
('20200615192104'),
('20200616110410'),
('20200616122221'),
('20200618185342'),
('20200621173702'),
('20200622204322'),
('20200624213348'),
('20200625113024'),
('20200629110248'),
('20200629112124'),
('20200630160420'),
('20200630162805'),
('20200706201350'),
('20200707205433'),
('20200708103531'),
('20200721061545'),
('20200821145238'),
('20200825111802'),
('20200826103319'),
('20200826104040'),
('20200826125501'),
('20200827163244'),
('20200831100838'),
('20200901063517'),
('20200901072737'),
('20200905085117'),
('20200907124331'),
('20200908102439'),
('20200909092128'),
('20200909093022'),
('20200909104621'),
('20200909110858'),
('20200909230057'),
('20200909232214'),
('20200910112547'),
('20200910130625'),
('20200910134104'),
('20200910135503'),
('20200910174355'),
('20200915083738'),
('20200916090448'),
('20200916093430'),
('20200916101741'),
('20200918001842'),
('20200921122702'),
('20200925090041'),
('20201005094319'),
('20201005094414'),
('20201005094624'),
('20201005094706'),
('20201005094759'),
('20201005184219'),
('20201006135746'),
('20201006235455'),
('20201008151537'),
('20201011185833'),
('20201014143713'),
('20201015111200'),
('20201016161814'),
('20201016190038'),
('20201017145531'),
('20201019114421'),
('20201023024630'),
('20201025170009'),
('20201026030125'),
('20201026035737'),
('20201026205447'),
('20201028220553'),
('20201028220622'),
('20201029161106'),
('20201103124306'),
('20201105090626'),
('20201106142447'),
('20201109052150'),
('20201116165742'),
('20201116165926'),
('20201125170156'),
('20201127004708'),
('20201204004015'),
('20201207085133'),
('20201215134916'),
('20201221060316'),
('20201222121953'),
('20201227095803'),
('20201227112228'),
('20201227122856'),
('20201227164821'),
('20210104142439'),
('20210107075154'),
('20210107143116'),
('20210107144337'),
('20210113110026'),
('20210119144632'),
('20210125144855'),
('20210127100320'),
('20210131122046'),
('20210131134939'),
('20210201095948'),
('20210203092128'),
('20210203115242'),
('20210205111228'),
('20210215190016'),
('20210221070537'),
('20210222120555'),
('20210224082125'),
('20210224105650'),
('20210301092210'),
('20210308094007'),
('20210407141446'),
('20210422090734'),
('20210506142040'),
('20210506142603'),
('20210524151732'),
('20210526012315'),
('20210526235818'),
('20210608083658'),
('20210613115642'),
('20210616083754'),
('20210616084139'),
('20210616085215'),
('20210616183210'),
('20210622190146'),
('20210623055820'),
('20210623114416'),
('20210623123750'),
('20210623131616'),
('20210628104548'),
('20210711115430'),
('20210711133516'),
('20210712185527'),
('20210719084319'),
('20210726125858'),
('20210728191950'),
('20210728192553'),
('20210728193001'),
('20210728221647'),
('20210804072731'),
('20210805200655'),
('20210809121349'),
('20210811111704'),
('20210811113052'),
('20210815094039'),
('20210823125053'),
('20210825200057'),
('20210915110702'),
('20210916125152'),
('20210922070658'),
('20211018105756'),
('20211031091218'),
('20211031211651'),
('20211101083228'),
('20211109092321'),
('20211123124108'),
('20211124151409'),
('20211205210209'),
('20211215135957'),
('20211218114040'),
('20211227112443'),
('20211227115532'),
('20220105065903'),
('20220114095211'),
('20220125122413'),
('20220129104515'),
('20220129105154'),
('20220213150258'),
('20220213150321'),
('20220214014235'),
('20220216085014'),
('20220222020159'),
('20220222020230'),
('20220228063558'),
('20220228094617'),
('20220309114000'),
('20220309114026'),
('20220309114040'),
('20220309114202'),
('20220315092713'),
('20220409123025'),
('20220411120745'),
('20220417201537'),
('20220515073024'),
('20220515161200'),
('20220517091059'),
('20220525104600'),
('20220526090442'),
('20220530114206'),
('20220609083714'),
('20220614164047'),
('20220614164430'),
('20220616125300'),
('20220623073354'),
('20220623101945'),
('20220623142442'),
('20220623145747'),
('20220628134041'),
('20220629150123'),
('20220703075520'),
('20220703080935'),
('20220703114958'),
('20220717135457'),
('20220719084753'),
('20220721113202'),
('20220724105231'),
('20220809145458'),
('20220818055005'),
('20220823082406'),
('20220922163846'),
('20221009130554'),
('20221017100405'),
('20221017103513'),
('20221019145912'),
('20221025103047'),
('20221102083635'),
('20221106071319'),
('20221108224502'),
('20221116085250'),
('20221121223643'),
('20221127201850'),
('20221128072549'),
('20221129073517'),
('20221201071847'),
('20221201081454'),
('20221204113314'),
('20221208164056'),
('20221211112540'),
('20221212131946'),
('20221213145541'),
('20221214180105'),
('20221218082852'),
('20221219073650'),
('20221221083626'),
('20221222093910'),
('20221227112200'),
('20221227112544'),
('20221227143845'),
('20221228082807'),
('20221228084026'),
('20221228084554'),
('20230103154003'),
('20230109095135'),
('20230109110441'),
('20230109110521'),
('20230109193414'),
('20230123234301'),
('20230125071554'),
('20230128195154'),
('20230129091813'),
('20230129093045'),
('20230214064847'),
('20230219050312'),
('20230222144711'),
('20230305213244'),
('20230306131713'),
('20230307092728'),
('20230312095127'),
('20230312201510'),
('20230314035346'),
('20230322065836'),
('20230322084359'),
('20230326110807'),
('20230505113828'),
('20230511090435'),
('20230511090925'),
('20230514090543'),
('20230524073008'),
('20230531092710'),
('20230614064451'),
('20230625083033'),
('20230706100526'),
('20230717091250'),
('20230729022825'),
('20230801223929'),
('20230810124219'),
('20230815085301'),
('20230817124256'),
('20230821125239'),
('20230822061352'),
('20230828084018'),
('20230829072621'),
('20230829093414'),
('20230919111750'),
('20230924171319'),
('20231005113254'),
('20240124073659'),
('20240212084948'),
('20240216135539'),
('20240225092856'),
('20240302134502'),
('20240309064957'),
('20240309084306'),
('20240314104656'),
('20240324121720'),
('20240324121931'),
('20240402092130'),
('20240402152400'),
('20240506092425'),
('20240506092644'),
('20240526100323'),
('20240904115019'),
('20240905104325'),
('20240912101555'),
('20241103131507'),
('20241205104652');


