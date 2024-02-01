import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detail_paket_model.dart';
export 'detail_paket_model.dart';

class DetailPaketWidget extends StatefulWidget {
  const DetailPaketWidget({Key? key}) : super(key: key);

  @override
  _DetailPaketWidgetState createState() => _DetailPaketWidgetState();
}

class _DetailPaketWidgetState extends State<DetailPaketWidget> {
  late DetailPaketModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailPaketModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: Image.network(
                        'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUVFBgVFRUZGRgaGiMaHBsbHBsfHR0dHxsaGyEaIR0bIy8kIR0qHxsbJjclKi4xNDQ2HCM6PzozPi0zNDEBCwsLEA8QHxISHzUqJCozNTM8MzMzMzMzMzM1MzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzMzM//AABEIALcBEwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAEBQIDBgABB//EAD8QAAECBAQEBAQFAgUEAgMAAAECEQADITEEEkFRBSJhcRMygZEGobHwQlLB0eEV8RQWYnKCM1OSoiPiNENz/8QAGQEAAwEBAQAAAAAAAAAAAAAAAQIDAAQF/8QAKxEAAgICAgEDAgUFAAAAAAAAAAECEQMhEjFBE1FhIqEEI0JxkRQy0eHw/9oADAMBAAIRAxEAPwDMiD8ItiFJJBbT6wsJi/Dzm0eO59HCh+j4gnCmcFt0gk9IYyvic6y0mmimc71FBGRRUkCj6QWJjIJFx6QGFNmq/wAzy/yL+X7x3+ZkaIL6VDRh/Ej1ybQeKNzZtk/Eov4bjVjUe4gzC8flLu6O9vlGQw1Bb72LwPMmMogbwFvQeTR9Bm8VkpFZgPQVJgccfkv+L2+f3tGFzkxehBoXv8o3FG5s+hYbGS5nkWD019rwS0fOULINFcwP01BhkOLzWYrV2eumorCuI6ye5rcTi5cvzqA6XPsIWT+O/kT6q/YfvCIl6uY6ClEDnJjRfGJpsQOwH6wDNnqVdRPcxA0iC5ghk14Fd+Ts0XyUawMEaiCM7Ch7wWxaLZGNUheZJ9NCNjDc8fH/AG/dX8RnSvYesVhY6wHFPsZSa6NB/X1u7JbZj9XguRx+WfMCk+4+VflGWuKGIiBwiwrJI2iOLySrLnbqQw9zByahxUdI+eAxbJxSkeVRGtC0BwXgZZH5N+0c0ZNPxDNDeUtqRf2iSviOY3lR3Y/vCcGP6kTVNHNGYR8STGqhBOhqPk8ey/iOY9UII6OPm8bgzeojTNHjQrl8flkVC0+gPzBiif8AEiB5EE9yB9HgcWHnEdtHjQg/zLvL/wDb/wCsVyviNb1Qkp9Qfev0jcZG5xNGRCfiXGkyzlQylan8I6UuYV8T46qY6EDKnXc9zt0hOkEvDKHliyyeENVccmnUDsI6Fb949h6QlyM9iUVzVY02iUlALC33aCZcoEMnMQdxSgOu1IjiKFrFnFaM24t9IhHKpaQXja7JJQE0Gtn1f7MQPK+xp973vEkKpV+12vQEUItWOXiUkNelGGoOph0wUAJ2gqRK1Jb2+sVSwdAKXOv3aLUzGLnfZQLb2Yjr2hnN+AKKCQgoFD6/ofeKMQgvmFj8ukEKmgALc7EUaoNDo0eTkFSSUVG2tD84EZb2aUfYFQqDk/l3qIXJi8KZunV/WKMRFyCQrW/8GLsQpiPnr6v1jwJzUPv6aGIzKpr5gW9P4/WBYaLkz4vSsmAEFqM+52i8LP2DAbMg5K94rmjWKcwZ7ddCO8Szmg+/5EKmMyaFaj1/eLCvb1/eB0lqpqdv1EcSSKX1EOAsWt4imKgukTQsvBFLEGoi4gRUpQFheKVTfTrCuQyRctTXIH1iQRrACwb+loglawWr6fbRrZtDOkRCiYGRinNdLn+0EInBnBdO7fbwOXuGiwAxyl7RWtXttV/YxX4iv36QU7NVBBL9Ii8VhZZ4pmYpnHzjWbQV1NIrWsmlW+/eB0Em5pr97xYCfT0jXQCYSGrT5RXzK6bR5MmBO5Pe0TQigcnqN/aNYa8HOnc+8eRCZigk5RLdo6JerEfixfhlqS/4Ret9doPROCvOLalJexs2phJJmTSo5iQB0cbv1pDdM9DDM4bchq9bGOCSo6lRDEYN3yEORVJZxS8JpiVJUUqSHHe24rDPHSClloL30cU9eWj/ACiE7issBKVpJLBgQCLF6kdR2cxWGSX7kpQT+ANCzlJcA60NAzAl/SsWoXQlKSddHu2mnUdYaSsIhQChyOA7W2FD0b37QNOwkyW/hkLGycobqXYvFVmT0I8bRPDTQoBjUDXS96fOKRMKFtWzio7D7qYHlL5nWggk0I5a7h7sIYz5IWAbEAh9Pl3eHTBRCbKCwGYLZ+iv5/aIy3DgpIVsKdKH1eBlTlIKUqDNeC5eMzMCX6hu4h02hHRHDTCBRgAr2vSPZ+ICzT1p8nEeY1CWzOR+519WMCzZhFAaX9YdU9oV60XzJlqv9i4i+UoUr0NLwuStyAbena8FS1NQgNd6E03aMwJhanTq4e3vFqFC7jp0rbtFKJx8hLPbfX56RyJhSKlwD5n6/wAQox6lZCjRqs/raCM+5A2P33gFU65SKb/39orTPO5vv9IbsAcuegHftEZeLKkukPUi2xI01pCXi+M8MMlsxoO2qq94E4DxDIcihykuL32faFlLwNGLqzSplm5L0fp99I8BvQqbVvvXrFaMS75i36evbTvA3EcVkAZbLIcEU9Coe9ekLOTRoxTDStVRkV606eloHmKIYO7jr82LPC48TUAylKcJDF2qWDvb0Oxg1SkrqlT9SRUUDjpdnvEZSvbKqNFsvLqzjv8ANuwiufiK8tNO3QfekWubOAbPvR/swLNI39BFcckyc00cmeoeuse4eaqrE9Q0DmCsOoBLKNNBSvWLPomg7D4rMWIALxEy2Js13a37GKFBJbKDVwCzgbA+v6RNExQTWpt3tUEloROh6J/4ofyTWJpWCxzMDRnv26QKVBLDKDuT9HiSVZw5eltG9YZgL/F/KzPU01+/lFmGlhRZiTTm36Ae0DynJ5RlT+Y/d4kjE5CrKoADVVwOgY/Ie0RyN8Xx7Hgt7CZkkAkZVew/Ux0K5nElA8xmg6hiG9zHRx3P2LVEBTMmE0JCTUAvoe9tYmpDszE7EW3Gv1iv+mzAxS6khTEUHdwSHd/SKsk1K2Uhbc25YU97wbT6YQ/BzVhxlKg5BBct+vr2izHSEkGZkCvD5ixHKQ6u9QIVoxCk0UMyVXamlXo+8L8fxolBly+RKgy+u49dYKg27QL8DuUlcs0WMmZg7E2BIe+1Ib4bF8wQs9KVYtZ6fQW0jPcNxfiIKFlThLOL7PXVqegi1GF8ML5mSBqHU4DlwfLTMPapjSjfZraNQpHLysxqQxy1e4Ue0DIQkEFspUKZSkgmpIap9oS4fi0yXlzBJDbgm7A0LAVhrIxkua+QAKaxFHJvTSt2I31hOMoh7KOJYmUGzpGatf8ASCauHatIoEkzEJmSykPUuW0FNiB9iM/xriBWrwwwSk1bVQ67e1fSK8Bi1AZHYO+v9o6YuSXYjgma5EhaeUpLXcPl0aopt7wLOwrlw4rV9OxgCVxFQYBeV73D2d/UCGZxQPLMAVTQfMGxtrBWVrtCuCZUJiAWSHPv7P8AtFeJ4imWEmyiWAuGcOSPf3j3FYYBJVnSEpBJCrgDqBVy4jK4icqYoqVc/LpFOaa0CMHezaHEkhw1dHpW1X6xUVCpqCQxSz7VhVwTFDyKuQw96pOzw4loB3LivfYm1+0GLFlFpgqEklkufrF/h5ElRUGFSxqBf9I8XOZwizVLfN731hTxzFK/6ZIJoVEEGlwlx7+ghnOhYxt0BT5xmzCrTQGrDb6n1j0oIqDA0mYxi9c+npEi/XQ/wCxMAc9DoO/6RbjZeVLFspu+YbCwbTfeE3AsTkmOajan28PMfLXMYJdNX5TW2ofc+saTbQvFKRnp8rmKaJY29x9TvrE04hSSE+9QQd+lotxq8kxLsoChYAE7g+/zivw0502uXHo9ntCDjxTgOpi7kKd6Cj7WgdGJStOZNakP6t9BCjiuOBAlIdkjmO51HYNFHCsb4a6+U3Gj6GHg6FlG0aWRhXYqLB7VdhekRnpBJIACRZ6v0rf2i9yXdQDhqA0GwOjx7lcAIKQ1nZzfX9IdzVk+Ghemcom/p+wEGomZrVULhTVL6fesV4gl8p5/yn7tAyZolkqUSkj0b0hhRlnJ8wAL1di5dhY12j1SwHDBnqWpS3QfzaM7ieMJVLFC5mO1ByheYAtega+p2h2qZ4ic6QFJPl2bqN7+5hLKONFmIxSiHDs1+p0bt9YEUpRTzqozsLtFqU5ACVhy5Ya7BzpaF61qKn3/AE3B67xkBhHigWCI6IplrNWv/t/ePI1I1sdT1ZxyVU+bvUEpqWNSTdoGn4liUlRSxY0NKeVwe9oXyRMVVLF3YOztZgLFumorBHFlqCytRSkMFCtDXnoKXJo9uzDzvTV0dLYNxbixly3BBWeVPsHLGpYH6RjSXrfWL8dijMWVH0FmGnrAwjqxxUUKH4Cax1qfn9vD1C1B0pchSWBAcuwoxD/YjMylM8PeG4vKQuXRX5q+rj17NDSWjIpxUtQ/6iShV0jKwLkkxFWPKJeUEgkuCCQAWavWl400zHoIV4klS0qqQLA7CzHUVsDGN4hPSuYVITkRZKalh1cmpvfWEjJy00GUUumDgxdhzW7RUkRJBYxYBocDKz3SFHrRmBL0uDX2EM5U0h05PKKM7gVBL7VMKuGYpLuWA16emo/SH06aiXLXMUgABICCC5UovZvKQdfnEJ99AoQfEmJqJbMQylVzM4oMwvQ/IXhImLJyytRUouolyepjxoslSCXYRVWrvGwwk9JlkKSygHVlYE3ahvTWMbhllKgRSNXwrEBSkpRMSVrGRi4BegL5WcPT1eEyXWgVZPEmXISZnNVPKDYq2pcd4x0yYVKJNSS57mNdx3hSlZ80wnISDQZfE5QwUWcEnRx2jLLlVY5Q3LTVtXdj3EbHK1bBVEUiPDB8rh2dNZ0tId+ZSn1Fgk/bRL+kE+Wfh/Vakmn+5Ih7QaApC8pBhx4xJSHASS7kJftWv94Wr4dMTUpBSPxJUhaaB6qSSB6xfh8LNmI5EOgFiQpLizukHMKHaA5fIHGw+YZczKwDJVRmdnGutXvoRpAHElSiVLlggk0qG0q0EyEyhMyFTADmCgRmZNQyaPf2rW6jEFOY5QyXOUXo++sJFbMCkR4IuIiKYqMaXhGNC5eVdSn5gWdr0+kMCB5qD5AdD9+sZjhU/JMD+U0IOx+3jUT8VkdLk0K8qcpATQZbc1C/oQ8RyTaehaA1TAEkkqSkkB1BxUEv0a0IcTOznOScgsPzd+kNFr/xCjLz5JKXUpRzF2apAcmpAYPo2kQXwIzX8CfLnEV8MFaF/wDFMxKQr0L9IeMm1syh5QkWvMXN+1NoYcF4l4amIBQbuPn+8LTEYcxo8XNLuXcsa9tNhF2FQZhIFzR29qmr9q0gTgy5a38QnlZma29do0K8dLSkZAydCBrXVjV6esFy8Inx3sCVw4fnPzjos/x5Nvqf3j2BbDSFuDmpSpKXdKhVRy8oJ1AFnUKWMA/FWKSSlAYrB5jsBRuxZ6bC8O8ZPwsoKSW5k2SBmIAVdtXbU3jDTZhUoqNyX1PpWOeC5OypS0exIRICLmOlmrM7w2wyVp1oSxpQkFQNKaAFv3hYikMMGsuDzEXU9QRVJMZmH6EZklK6pNKHS9G1D94znEuHqlLY1SapVuNu41h3NmqQh0kZgxSWBcEgWsex/SD04RKkeHMVmSa5qDsQdCzHpasJdBqzFARMCNNh/hiS7LxaQanKAl2D3c0I1h3gvhLCnVSx+ZUxKR7jKISWeK0FQbMGiYoNYt0Hsd/WNBK4nmR4aZaplOaimCRsEvSgqaRtP8nYNPnQjtnmKPsFNFsvheGl1ly0oNs2UJPZ3JHvCP8AER9huD8nzaXwHEKAIlrY7hvVjWCJXwxiSrKUhHVSktt+F69I+kzsOScoUpBY82VJFhvUH0/SOk4WekgjEADolDn/AMgPpGWSb9gcEZLDfBYNZk07AIZh6qFa9IFw03DYLELSZa1lJACiRm8tWTQNWn1j6I84jzIp+ZMs035T9YoxOFkzAPFky1nr9lvSJuUv1vTDS8CE8fwa/N/7IJ9LEQPP4hgDXIhR/wD5g36qFocL+GsCf/0t2mL+jxyfhvCptLB/3Eq+piPDHHab/k1MC4Zh8JNcjDyzUNyJa1mGtN9Y0v8AQcOR/wDiS36CWQPWkCSMIiWGQlKRsAAPlBomp/Kr0UYeORPv7jRiUK4KlLGVLMvlYtkA9EuR8oCklfNmUFB6cvpWtfYQdiZn5QR3Uf3gNCCBSEyZFegtIEnoWqWpKVS0zCOVQTTSuUkl71roWo0YzE/CmIqoBCyXJZWvQECkfQ0papsKmjxDC4qVMRKWFFPiAqTo7PozkNXv2eGw5JtaFcbPk2I4bOSVAy18vm5XYs9SKdfWIScBOX5ZS1f7UKP0EfTF+J4EyYiYhalzCqSE38PMhIUxNg1ehgMcUxNUCUFKyhsqqPqSQLG4ffRwI6vUlXgXgYiTwqc6VeEpSaPkKVFjryFTa3EOeM8SWSqVRCQAlWrNcC9TQQLJmzcGpYICFLckDLV3ysz5WqWIF+tEuJxRUSddYZR5O2IGS8xSQlggVI7O1db/AFgfM1ojLxC/CUkA0IJU9gaMzaqq7wOiYd6dhDU7HuNF2PXmWV6rdR7uX97+sDR7PCnrtTtEAYoIXyZpSoKGn3bWNLhsaPDK0qyACtMwfUBJ9flGVeCcHMugnlVdrjY12+cLJWhWjTf4mXqZb93+ojork4VRSG8dQahGRiNG5aU00tHRG/k2jO8dk+GsIDZSMyQCTQk/mq7g7aQsjV47BrnMJipaEgZgs8y2NXUrMVs71YChiGK+GUplkiYFMMxUASbcqWdhmOp2MGE4pU3sejMCJpEaaXweXM8NQYABi1M5DXY0qpnbS5vHuJ4D4hHhhAYKfmKQWYgOR/u9xowgrKgUZkQZgZpBYUelqG1CO4EOlcOTKIKJAWtNWExR1Z2oWdqt/KwYE+IUgFBI5BUuT5SXdXMHpezPYsppmoZYSYnJnKvKS4FABWo9GMPvhuX45YA+Gg5VTPwv58ubWqh/5d4S8M+EZ0xjOV4aNicyj/xFBpfpSNhguGSJEsyggzEKVmyrSlSQd2yh7DzO0Ry5YrVlIKuwvHYCWpPhzEIKVWDgO3ShcM9NoXcOwvggIzZgCyWAZKakaUN61ekdxRBnLlpSpsiwpQSWZORQDsCwdg2zwUuWkMVK7affpHDKdKl58DNq9F6cQOv0+sMsFxGWgf8ATcn8RNfRxSFSEBuUEPQcsWGWev32tE1NxdoydDz+sA2T84lL4lLsqWFD0EIcv9v7H5R5h5yVeWhaxuBa2gpDrLLsPNjLEzErU4SEDYDT9TFaMSoHllJvdczTflQWN6QOV7D5/tHiVK2YdP1MNHNJb0K9hS8fMSQBIQU9FinopIH94nOUCxyBJZixJH0Afq0DA/esehR6w7ztro1ItpEFiPM8eGsI5WNaILMSlqqxaPFB94gR1hVKgk580pSrKMymol2f1NAIWqStIlBAU2HlFKMuXmJSE5GNSGGp2rDMTEkMsU3Fx17RUpDWqNx+t4opuP8AaBi3g+I8GcmWEgol4REuzsoKKlOEvzEMTvRod4jDJLzUykoWUs6SQctT5TQVL77wNLpVgDv/ADrE5+ImZFBB5m5a5a6VYgD/AInsYp6vLTMqPmuLwiuYgqmLCudgSC/4hqdqi+4DwqdSyEAqVXlQHNeg3g3iWJmZuYFPOVOPzAkUIuxcOIlh+Jz1cvjKqKc1cwqDu7hn6neO6L1slNK9A6VKSDJUAjmAmEitCTU1s9h06wKtQc5RR6PduvWJ4maqYtSiOcl1b5tS3U+0Vo1hhQlctcyWgpQpWV0uEksCcwBbqVe7R5hOFzJjEABJLZi1xRr36UsYYcL4nMly1JlpdWZy18pSQTTYgVqOcw7w83GTBmGRiNVMxoQDlBPps0QyZJRfj+Qxq9iD/Lc1yAQ+juN++37tHiPh+eQTyBi1VpDj8w/09TtDad4/MgBCnYAIWm97Fie6WjzDeKlWWbkCmYS1qUVq0zJYKFMpNSGLnWqrJP4KNQ8WIJq1oJSSHF2U8eRtJC0lIzYcPq9T6nJHQPX+PuToy86Z4ahLJSUhW7lixu59nrFWKmeIUqUspSEhOV6nlLEBrFmOtetWy+Cy/EJmzEhwCMqmcPrmJeyR6amCRwzCgnMQ5BeoJDgOoA0evyjc4LYEjPYLikwOlIOYbOSwsKuTYDp6wwwKp8z8RACqLW7Eg6Oza2DjtDPDrlSyPDCCBUqLKUQHBqmwvT6NDDCzpilAplkSylgwFDcKIFDQfWFll+P5MTw0pQDEZlE2cGhYZmP3129xCUnISphLUFjlLOEkAt3f7rEEyEqCxmCSQCplF2BDVNal+nWgixIy5gQrqS5ckNpfrVhl9Yg5ruxlJixXH1HMpDZUrysfxEMSKPapdmYGD8FxwF0rKQfYACxKiW5g3veBpWDllayFElShmTMLEcoSMoAFG1eo3aq1cgIXLALIzOsUAASMrqUkAKZlBzV1ANDcIS6WwKzU4niMtDZllL26vWm9vsxUvHc8tUshSJijLJeyqEFmd2zBrW2jN8bxgEyXOllK0kaspKVguQReoqz7kQJLnqUpElLpKpgUChxkejDUO/RmjRwqrKJmxm4hXi5PFZSWcEH8WZgCLWrTaLsXxFMsgKLlnuWYEWfWu+ohdw+UhClTUKJS2RJu7VVMJYuknXo8Zb4nxazMeu4JFdNwK/fQLHEpyr4FlKjVji6RVSmURSoailCjki41go44B+ZLOz0BcG1K/qHtHzJOKUAdSwAJFUtsexaJSMSoPelQKs7gD0qffdor/SL3Etn06ZxVCBUurQCtXajGpiuRxiWVMb2uS9Pv+NMHjcRMVVgEhgBRwHoqtakt794qwc9WYB7kE7mvauvuesZfhVXZuTPqGIxKEJzK/n+8eYfGIWAQ1Wsz2tC/jctS8NSuUOoN/pdwdKxk+GrmEpWkBs2XXRhYaMoAfxSUcNq7HcmmfR0nb79Ypxc4S0FZ03gtDACmkKviRAVIXzZerPSkJFJumO1oVo+KZeZmfR+/aHWGn+IjPoa+n6Uj5MmWrMAmpfT76RvsHxKamWhCJOYZWPMCfKLepFahhFsn4dJfSTUt7PeJ/EaJSijYfN2rsI7hXHxNUwNWFx7tVm/b0jE8WBM1ZUkp5jQ9C1erj5xfwJEwLzII6ggl6WIFWeH/AKZcb8g5Oz6VicRLSQVEJJp0U1baFnJjxE4FOZ3ADlox/ETMJCOYhpZowSlRDKJH4k18u4MeKlzJUhaVKcsVOkCgaxazFre9IT0dXexuVvYXgON4XwES50talfiDIyuSSVVO5JtAGMHDmUuWJ6FhJKByZc+jsXZ4WDC+JifDzZQVlAN2CaDXYRTjsCZcwoTMSvLT8u70NKNvqI64qMXSFbPZuIlrAJl84F3AroetNIAQKk/dYJClyyQpB6g0ihKodBe0MOE47wFGYznKw9VJJ+QPyjV4LjqJlRRQukFgzliN9B6iMuvgswpSoO5AU2WgSf8AUCXOpDBoXDDTQSAhTh3YbByfYPEZwhPfkCbR9J4eoTwJi15wPKh3CKgsSakuEm7USwoDBMzGS0qyqmINQwLUr2L66i0ZH4WnlEtYzUJtQVtQl3F6hiOsJuK4iYuYVHypWzBzagP/AK2jneJuTV6GctH0WbxaSCQSHFDQfvHsZZE8kArkgq1LzK9eVTe0dC+gvkHI08xYYvlKhocoL6C1dKs/rHkuYFKBKUhXVL1J3dom2YWJYOLWu1NnAf8ASOPhqvcAi9QSP3N+/cQbapNdgK8ViUS0ZllhmCf+RsLEPXbeAv6yggpKaKuCXOWosDR8o9wCIW8ZnjOnLlysXNCXSHSQGJoxNNtXqHg5iVKZeUKKVIWcrKfluSwIVWhS/wAotDHcbYtmhBSZf/xpIIU1QpmHM4KuY032vCyTxKZmKJjWZvMkkEgqcgDMQq24VakFcMUuYGlpNGCildbuo8zuLa+zQBOUU4sjwxlKSp1AijHl5WDlQa5od6RowVtP/Yx5xWdkXKdy6iWvly5WI1FQ97CPeOYYFCGZwopI5SwUMzBrAsTQaw0xvC0zJiPEUShLqYqKRmrzF7uKKZjTVwYVcdmJQJYSXFTo7AJCCTcgpNCb37Ui06oaMdiUhKULSaMc6Sb5kuAH2IJDHeK8BhFzJgyAsA9veunfrFeJXm5aOo3oWYKYPd3axs940fwkEKQolwUsMzU1f1LN6RaUuMbGrYajiMqWlMhCVu7AsHBcEvm5SObf8QpCrj2CxE1YUEAoIACg47OK5bAV3ejxppOElCYrKkh2OcnvqdOm8XTJZDlKmDHUfKhHX+8c0clSuP3JtNmFHBAUpCpiUKJNClRUTR7aAg3a8MMLwPLmIW7O6WINj+airg+hh/8A0qUSFKRzAeZzf36Uez02hghCTYD7H8XhpZ34GWP3MtKwATeUgCtVpqzkk7Es/wAtohhpCJUsrYjmcGxdrO9CwNNKxqxKSkmtLBmfe+ul4k+n9mP11gesOsaM5NmYkBYSKEEtlJB5UirAc1D06CBeHcGWJiFrQlQJzKQSHA3JoL1b9q6xUpNxRWzEORSKQsgHOpLXfvRhWwYXEH1daQHBXQZJxYHLsLO9+of7EZrj0nFTCoJJyFqfoT7n+0OkzUEMKACru1qdvXQGJFJvmf26U62/V4SMlF2M9qjFYT4fmghWZCK6mo99Y0quHqIHMM4uoBQJby2LNQwbJkgEuVOS5JLgWDJY0+r1ipUqZ/3VZR+FxdJNXAzHTX3inquT2xVBCOf8OZl861BShmzFBtqb1d8v9oN4dwSVKClGYtbguGYVpcV+cH5BqTm3Jcseugpo2kXIWkIIUKVAB8pGoVRzsHfvZtLK2g8UigzJaWSlBB0diGonKVK1cu2z+o/E0JMpfLVTJJ151JSOlyPeLsNjUKWpKwgvQJSGygM+jM5uLN6lL8TcQKSEJJYhJCHBl8poRlYu6QKWsGq641cq3/kCS7F/AJYXjF1fLnUCda5RbXmeNJ/SJWYr8NLqcGqjdqf6T0jI8H4mJc3MoEqUMpULAEgvlSASqmpr0jU4VEqWSjxKKXUqKg61OMuWpSKPU2Bi2ZtO/gEUjPfEGHCJhyUTQN2AjvhfhqZkwqmB0oDtuXoDS14v+JUqCgVEEkaEEXNQRpBHwr5F9SB7A9OsPz/LtApcqNJiMUEhRamgYdH06wO4RLChL59wA7mzdtqWN2iJWCDcqvUltGa9DUU9Yrw5WXFXABdVCwFwws+n6RzNckUqw0y3L8tK2qS24o7gU/WBZmElKSQuWnq16ly7ervAqMQoli1Be1aACrdHsRSLl4rwyfESoUuzUYDv86+sFRkgUiSMHK/Kbm56mOj04saEew9qqjo31f8AMPFFyQKOaMS9Usl7VYAilOneKOJAS05kzFZWylNGIICXBFT0Y3218VNVOl50tmSnNzB2IuUq99+u0DYiQpJZy6qHKzAaPYvWvTStBGS89katCpGJCkqExKQQMtQTo50DHetlQxXwpUwcykozhKUnM+ZIFQCSASxAZqjdmiCuGBBJUkBB8hT183MLB3LGutLQbiZKsgALJAq1SyReliXFbvDSkr0wUUcHliWMiVoWzsoByQw8zVcEO3UdWtnzFqmhaMpSxKnJzOxIT0SwBYWL7wNhJr0UnLmDgAMwcAJsa7v1inGzFoXmBJBQys1CGAYumrZgLB3PoFr6rG6EHHeLGdMetA1d9R/eKJuJKlOSTZnNWAoCdWDCLMZiEpzUBK8pC2IqHBIBs4JGlGerwtKXNFADr9vHXGKSpIKdDHFNkloTlzedRHmDgBKH/wBozN1EPvh1Cky0pJCQutiVEZqlwaADpcnpCbgvDzMmAEM6cySQcpIUAzirPrGnwMhQBUtaULU6kObBhUq8rMkD7pPK9UFDZLhiHatyHUQCLOdx9ho88UsQ1elf5imSKNm8tVFru7PoG+rUiYLCpvRx5ncVZi9T07xx00VVBstVPLU6kVNfv5RaiWovs7/L5V6QPgRR2q7W6D3hkh7ffX76QjbstGKaBvDCfwhtLRWp/wCOv30g1aNh/IgaYgJDvR9SBU9T9YN+4XEoXTX2+6QHMlKNXFDSjhuxDX7QzmymDuk/7T0bsWJAMCGWSDSgv7266QYpkpJAc/MmoSFBspqXd2btYQTlLM/f96wMVEfiDDzHZiSQ2twdLjSCQHLZXF371Ytb+e8UadbJouQCetf0e4jxAq9NXtpTteK0TQ5Giq2ptv2j0rv5qb7dH9b9YWhuyQTUO726Xp7v60EUY2eQnKAwq4c+V2Ki93ItalmePFzwBUiuugsb7n7sIVcRxLEmpJOazJYULvcNb+zNGDbFkDnENnTlLeYlIAISkEMWajHV6ltIz2LXmUpQUVObqvaC14xYChmcKSBW42AOlCR2JgJGnrHXCNbJIpkLKFpUzkVYhw+jg+n8QVgZ5XMzHuRQCgodhUCt73gVQh1hMAlJ8NXnUE2DhLklnBuwAoNTeGm0kYY8bliZhkTEghixF6qYEPplUG01pEfhkDw1hnIU9bMR/wDWJ8VT/wDEQxc1LKLAggMQKEsL0r7RH4cQwWew+p97RJP8th/Uh3UEaDsKEkU+XyguTPUWDghqggb3Jbb6ey1cwE3YmtWq9CHs/wDEWGYxJG1aa6EtX5aRz7RVSoe8pOXI6elmPSKjhEKBGR0mjEUbUdBU+8LsBPBUdxoCCKuxZr+usOEqOVyxewH0qavWkOmy0WmDf0ST/wBoff8AzjotVMl7n/yI+T0joOxqiZxM0qLEEHISGIY35hV6Zb35YkmeQWCbAjKdiqpcDKQwoxLU6t0zDgsxDgs9OUPmy8mrAgsfRrRlTspKwaHs9WYnLbtftCNVbRx8dlqZ5HLcZnLOQHGj6sFbkUpCxC0+IrxAo81JaRyhRAI81DMy6mgsAIJUMqwCpWZSi9MyQRTelutnHX1UsDMhakhJTmJYseZil0+VQf8AExq+7aMUtitFHEsUElBQAEMRUkkq9TQh9CwcVrCwITkVNmqOZJfK3O3MPLZKcwYXvWCOI8MUgeItSl+IHJSjy0NSKAOGqwue8IuL4pBmHIKCh3t5SUkUBfrS8dMIgbti/HTc6s5DE3Gnp+3eKULaPBLcwZguHLmqZCSd2Fvtov0jIa8FxSAl1Epym2ejEgFPzUqo3u8abAAzJYWgiZzsBnIVUFQSc6RqxoauBV4zPFuEjDywlSk51LDj8QSAr0u3yvpDg3GFSixZSCQWDZgygXST606xGUVJWisdOma6Xizny5S7GrEJOUsoKBD0FS7m3QQ6RhFLNZXXLmPbuAwFulIK4YygFKlq5jmzEUysCk92I9oaokJAygHKXoAwq+kc9Iuoe4vlgIICULQ+yTQdVF9e0FTMUld2JuxcH0esFZOraA17W/tFS5FC+hcM1+mx/nSBQ4OTmAyhw3cW0+9IDxOCVMDVBsaNXcDXvb5wbKzOQopKDW45TqlrZfoQdxF6lcpy5WHW2t9mMBR8hb8CeThzKSQSAAKAtQPU0e9de8Az15XIS+xBFdR84c4vEEELSSMt6P7iqdD7doy2PTNmLJlEtl5aIoRUuEjUPVveGq2Tm2CS8UVK5rK5nDCwNEh6838M0T4fMVMmFKAoHMQCopSLU7Oym/WHGE+ErrmTSCQzJAygXyg39Q2272TPheXk8OXNBdsyVkuw6h6hyRaKaI8G9gypC0MVZNmCiSMtHCQCdL2MULmkuC1CwvzWrb1JG0H4XgZSlUta3YMpnSzAsWJPoQwoY6ZhJaQoqSVMW5r1AAFK26WiToooUArwhbKC9SACDUmpFLnrCbHYGYcpCVEZeZgpLUGYObirdY2HIPxFjysb+rvSl6aVNI7ELSzPzPRwAauHBs7E1aHU6M8aZiUcHUJZOTOvMAz3diksQDatd7awrVLOYunKSTRmAqXYbO4j6MvCpWakp2LNTuL2FaRhpgdRO5PzJMVhOyUocQZPDVFOYJOXdi27PZ6QdwjCzFTAEhSjsxNGJpQkdGjeYPDoTLSjIByilKlqv1ivEyUrSApAKg+Uh3TQmihq6em+kK8l+CnofJmuLBpZSFJLkJpegSSVCrWvv6wPwiQvw15dVNe7DTc9oO4zh5cuWCla861VSS4tzHe7XOsWcGWBKLqLklnduVIItQa3/aC2uOifD6tlcvALfMdCfyktY1967QShGUhmKR5g/NZx0ZwBF8icVpAIazsC4AuxsbvUbxdi8N4ZDELcXcp12q34agnU6RBtjpJdFMmVLzBTEdGcuNh9Ya4fEpNrNq4Z2a4rr1hema5TkaosaAXHuKd4mghJYZ3AKWSda0OYsXqzijRkykZUFrNbD5/tHR5Kn0DhQ6OKf+0eQbG5MzknLLUlS6Z08pFwTlDOKixD9ouMrMgZiksaFSSQpgXo7guCz7dY6OhfY5G2UYgeGVZh5mGUgAodWZwUu/MhgAQzvFa5ACXU4JOV3JPlYihGj1q/rHR0M+hUBY8rKkoXznKkpUybW1qRQsDoetFSeEOFE5UiqgQCpi7tUuLAXNH1MdHRaOgF03hZWUhDALmNV8o5SoBhVmf30jYYHhyEAiWkJYJY3JzEVc9PWkdHQJydHTiiizG/D2GnqzzM2ayiCqrNRi7WIpFuE+GsJLUCEZmH43UKmhaz6fprHR0R9SVHQ8cbHk3GgKShw5IFc2r2YGrpNzpe0XzcalGVJLk0sf0jo6Mg0VCckEJDsXvWz06RZJLWs1i4+jj2EdHQzEJm7UNt9Xs9BFXhA+ZSlMd2AYUoGBjo6MzEJkpww5maijQM1QzV6u8Z3HY2YJiwkBATyoJCSMxDl2JLhlOdXjo6AhJ9Iz/Fp0wCb4s1SgGAIocwy2A/CQuoJu7Qp/xiUyyEKmJUwzAqLEuxYJp7x0dF49EG2OPh7ikzn8RZUgAeYlRvYdCH+UM8NxMKmIdOxANaOeYndiN46OiU0rY8W9DQz0rcgXLN2LffeLghGrVBbzW7Dp9mOjomURTjZeWUVSypLkI0/ErI9XrUl6aPA2K+GZan8JRQRvUU0A/mOjoe6QWk+xXMTi5CgkzHBPK5zBRpStRvpaKD8WLSFIXLS9Q6SRXV7v7x5HReMU+yLk10IsRxArVmUSfenbpFkviGUM33TW+kdHQziiNs1Pwxx0qC0lIHIo5yxfKQ6SnLQMWp16Rfiks63plKmYjVwzEnXpaOjohNfUXj0FcNwz1CgQ71DG/mtfSvyZyUZLLAIDNQubn10Z39Ka9HRJvT/cvHoXycZmBIM9syhSaWcKILcwo4Mex0dG5skf/Z',
                        width: double.infinity,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Text(
                              'Open Tip - Labuan Bajo',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyLargeFamily,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyLargeFamily),
                                  ),
                            ),
                          ),
                          Text(
                            'Waktu dan lokasi pertemuan:\nOrang harus kumpul di titik pertemuan yang sudah di tentukan, pada pukul 07:00\n\nTermasuk:\n1. Akomodasi\n- Homestay dengan AC\n\n2. Makanan\n- 1x sarapan\n- 1x makan siang\n- 1x makan malam',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 20.0, 20.0, 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Harga',
                              style: FlutterFlowTheme.of(context).bodySmall,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Orang',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                                Text(
                                  'Rp. 123.123',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
