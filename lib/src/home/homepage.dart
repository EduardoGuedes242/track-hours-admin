import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:panel_admin/src/common/Cores.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.body});
  final SizedBox body;

  @override
  Widget build(BuildContext context) {
    final String currentRoute =
        GoRouterState.of(context).uri.toString(); // Obtém a rota atual
    //final String currentRoute = '/dashboard';

    return Scaffold(
      body: Row(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: 240,
            color: const Color(0XFFF5F6F8),
            child: Column(
              children: [
                ItemMenuSidebar(
                  isSelected: currentRoute == '/dashboard',
                  title: 'DashBoard',
                  goTo: '/dashboard',
                  pathIcon: 'assets/icon/dashboard.svg',
                ),
                ItemMenuSidebar(
                  isSelected: currentRoute == '/employee',
                  title: 'Employees',
                  goTo: '/employee',
                  pathIcon: 'assets/icon/employee.svg',
                ),
                ItemMenuSidebar(
                  isSelected: currentRoute == '/menager-hours',
                  title: 'Menager Hours',
                  goTo: '/menager-hours',
                  pathIcon: 'assets/icon/espelho-ponto.svg',
                ),
              ],
            ),
          ),
          Expanded(child: body),
        ],
      ),
    );
  }
}

class ItemMenuSidebar extends StatefulWidget {
  const ItemMenuSidebar({
    super.key,
    required this.isSelected,
    required this.title,
    required this.pathIcon,
    required this.goTo,
  });

  final bool isSelected;
  final String title;
  final String pathIcon;
  final String goTo;

  @override
  _ItemMenuSidebarState createState() => _ItemMenuSidebarState();
}

class _ItemMenuSidebarState extends State<ItemMenuSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.04,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    if (widget.isSelected) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant ItemMenuSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    context.go(widget.goTo);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    widget.isSelected
                        ? const Color(0XFFEAF2FF)
                        : const Color(0XFFF5F6F8),
                boxShadow:
                    widget.isSelected
                        ? [
                          BoxShadow(
                            color: PaletaCores.textoHint,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ]
                        : [],
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    widget.pathIcon,
                    width: 24,
                    color:
                        widget.isSelected
                            ? PaletaCores.azulPrimairo
                            : PaletaCores.textoNegrito,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color:
                          widget.isSelected
                              ? PaletaCores.azulPrimairo
                              : PaletaCores.textoNegrito,
                      fontSize: 14,
                      fontWeight:
                          widget.isSelected ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
