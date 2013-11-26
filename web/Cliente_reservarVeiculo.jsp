<%-- 
    Document   : reservarVeiculo
    Created on : 07/11/2013, 23:17:29
    Author     : Eduardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@ include file="headerCliente.html" %>

        <style>
            .fixed-size{
                width: 100px;
            }
        </style>

    </head>
    <body>

        <%@ page import="classes.data.*"%>
        <%@ page import="classes.transacoes.*"%>
        <%@ page import="java.util.*"%>
        <div id="base">
            <div id ="cima"><div id="logo"></div></div>
            <div id="tudo">
            <div id="contentRight">
                <table>
                    <tr>
                        <th align="left">
                            Local da retirada
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Selecione</option>
                                <%
                                    Estacionamento e = new Estacionamento();
                                    Vector estacionamentos = new Vector();
                                    try {
                                        estacionamentos = e.listar();
                                    } catch (Exception ex) {
                                %>                          <%= ex.toString()%>
                                <%
                                    }
                                    int size = estacionamentos.size();
                                    int i = 0;
                                    while (i < size) {
                                %>
                                <option><%= i%></option>
                                <%
                                        i++;
                                    }
                                %>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th align="left">
                            Data de retirada
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Dia</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Mês</option>
                                <option>Janeiro</option>
                                <option>Fevereiro</option>
                                <option>Março</option>
                                <option>Abril</option>
                                <option>Maio</option>
                                <option>Junho</option>
                                <option>Julho</option>
                                <option>Agosto</option>
                                <option>Setembro</option>
                                <option>Outubro</option>
                                <option>Novembro</option>
                                <option>Dezembro</option>
                            </select>
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Ano</option>
                                <option>2013</option>
                                <option>2014</option>
                                <option>2015</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th align="left">
                            Horário de retirada
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Selecione</option>
                                <option>0:00 - 1:00</option>
                                <option>1:00 - 2:00</option>
                                <option>2:00 - 3:00</option>
                                <option>3:00 - 4:00</option>
                                <option>4:00 - 5:00</option>
                                <option>5:00 - 6:00</option>
                                <option>6:00 - 7:00</option>
                                <option>7:00 - 8:00</option>
                                <option>8:00 - 9:00</option>
                                <option>9:00 - 10:00</option>
                                <option>10:00 - 11:00</option>
                                <option>11:00 - 12:00</option>
                                <option>12:00 - 13:00</option>
                                <option>13:00 - 14:00</option>
                                <option>14:00 - 15:00</option>
                                <option>15:00 - 16:00</option>
                                <option>16:00 - 17:00</option>
                                <option>17:00 - 18:00</option>
                                <option>18:00 - 19:00</option>
                                <option>19:00 - 20:00</option>
                                <option>20:00 - 21:00</option>
                                <option>21:00 - 22:00</option>
                                <option>22:00 - 23:00</option>
                                <option>23:00 - 0:00</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th align="left">
                            Local da devolução
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Selecione</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th align="left">
                            Data de devolução
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Dia</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Mês</option>
                                <option>Janeiro</option>
                                <option>Fevereiro</option>
                                <option>Março</option>
                                <option>Abril</option>
                                <option>Maio</option>
                                <option>Junho</option>
                                <option>Julho</option>
                                <option>Agosto</option>
                                <option>Setembro</option>
                                <option>Outubro</option>
                                <option>Novembro</option>
                                <option>Dezembro</option>
                            </select>
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Ano</option>
                                <option>2013</option>
                                <option>2014</option>
                                <option>2015</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th align="left">
                            Horário de devolução
                        </th>
                        <th>
                            <select class="fixed-size">
                                <option selected disabled>Selecione</option>
                                <option>0:00 - 1:00</option>
                                <option>1:00 - 2:00</option>
                                <option>2:00 - 3:00</option>
                                <option>3:00 - 4:00</option>
                                <option>4:00 - 5:00</option>
                                <option>5:00 - 6:00</option>
                                <option>6:00 - 7:00</option>
                                <option>7:00 - 8:00</option>
                                <option>8:00 - 9:00</option>
                                <option>9:00 - 10:00</option>
                                <option>10:00 - 11:00</option>
                                <option>11:00 - 12:00</option>
                                <option>12:00 - 13:00</option>
                                <option>13:00 - 14:00</option>
                                <option>14:00 - 15:00</option>
                                <option>15:00 - 16:00</option>
                                <option>16:00 - 17:00</option>
                                <option>17:00 - 18:00</option>
                                <option>18:00 - 19:00</option>
                                <option>19:00 - 20:00</option>
                                <option>20:00 - 21:00</option>
                                <option>21:00 - 22:00</option>
                                <option>22:00 - 23:00</option>
                                <option>23:00 - 0:00</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <th align="left">
                            Carro
                        </th>
                        <th>
                            <select class="fixed-size" style="text-align:right">
                                <option selected disabled>Selecione</option>
                            </select>
                        </th>
                    </tr>
                </table>

                <form>
                    <button type="button">Confirmar</button>
                    <button type="submit" href="meuCliente.html">Cancelar</button>
                </form>
            </div>
            <div id="contentLeft"></div>
            <div class="clear"></div>
        </div>
    </div>
</body>
</html>
